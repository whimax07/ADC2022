package days;

import days.Day16Common.Node;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.*;

public class Day16Part2Attempt2 implements GenericDay {

    private final Node entrance;

    private Route bestRoute;

    private final Stack<Route> branches = new Stack<>();

    private final ArrayList<Node> allNodes;

    private final long answer;

    // NOTE(Max): Every node is at least two away from each other as that is one distance and one to open a valve.
    //  So to travel to a new node (travel and open a valve) and gain benefits you need at least three units of time.
    private static final int EFFECTIVE_END_TIME = 26 - 2;

    private final ArrayList<Node> testAnswerMan = new ArrayList<>();
    private final ArrayList<Node> testAnswerElp = new ArrayList<>();



    public Day16Part2Attempt2(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var completeGraph = new Day16Common.CompleteGraph(graph);
        entrance = completeGraph.getEntrance();
        allNodes = completeGraph.getNodes();
        System.out.println(allNodes);

        bestRoute = new Route();

        testAnswerMan.add(entrance);
        testAnswerMan.add(allNodes.get(0));
        testAnswerMan.add(allNodes.get(2));
        testAnswerMan.add(allNodes.get(5));
        testAnswerElp.add(entrance);
        testAnswerElp.add(allNodes.get(3));
        testAnswerElp.add(allNodes.get(1));
        testAnswerElp.add(allNodes.get(4));

        findBestPath();

        answer = bestRoute.getArchived();
    }

    private void findBestPath() {
        for (int i = 0; i < allNodes.size(); i++) {
            var manNode = allNodes.get(i);
            for (int j = 0; j < i; j++) {
                var elephantNode = allNodes.get(j);

                branches.add(new Route(entrance, manNode, elephantNode));
            }
        }


        while (!branches.isEmpty()) {
            followBranch(branches.pop());
        }
    }

    private void followBranch(Route branch) {
        var manEndTime = branch.getManEndTime();
        var elephantEndTime = branch.getElephantEndTime();
        var finished = manEndTime >= EFFECTIVE_END_TIME && elephantEndTime >= EFFECTIVE_END_TIME;

        if (finished) {
            var endValue = branch.calculateFinalValue();

            if (endValue > bestRoute.getArchived()) {
                bestRoute = branch;
                System.out.println("Archived: " + bestRoute.archived + " Man: " + bestRoute.routeMan + " Elephant: " + bestRoute.routeElephant);
            }

            return;
        }

//        if (!branch.canExceed(bestRoute.getArchived())) return;

        if (manEndTime < elephantEndTime) {
            branch.progressMan(manEndTime);
            genBranchesMan(branch, manEndTime);

        } else if (elephantEndTime < manEndTime) {
            branch.progressElephant(elephantEndTime);
            genBranchesElephant(branch, elephantEndTime);

        } else {
            branch.progressBoth(manEndTime);
            // manEndTime == elephantEndTime.
            genBranches(branch, manEndTime);
        }


        if (branch.visitedAllNodes()) {
            var endValue = branch.calculateFinalValue();

            if (endValue > bestRoute.getArchived()) {
                bestRoute = branch;
                System.out.println("Archived: " + bestRoute.archived + " Man: " + bestRoute.routeMan + " Elephant: " + bestRoute.routeElephant);
            }
        }
    }

    private void genBranchesMan(Route branch, int currentTime) {
        Node currentMan = branch.getCurrentMan();
        var distanceMap = currentMan.getDistanceMap();

        for (var dest : branch.remainingNodes) {
            if (currentMan.equals(dest)) continue;

            if (distanceMap.get(dest) + currentTime < 26) {
                var newBranch = new Route(branch);
                newBranch.setNextMan(dest);
                branches.add(newBranch);
            }
        }
    }

    private void genBranchesElephant(Route branch, int currentTime) {
        Node currentElephant = branch.getCurrentElephant();
        var distanceMap = currentElephant.getDistanceMap();

        for (var dest : branch.remainingNodes) {
            if (currentElephant.equals(dest)) continue;

            if (distanceMap.get(dest) + currentTime < 26) {
                var newBranch = new Route(branch);
                newBranch.setNextElephant(dest);
                branches.add(newBranch);
            }
        }
    }

    private void genBranches(Route branch, int time) {
        var currentMan = branch.getCurrentMan();
        var currentElephant = branch.getCurrentElephant();

        var remainingNodes = branch.remainingNodes;

        var manDistanceMap = currentMan.getDistanceMap();
        var elephantDistanceMap = currentElephant.getDistanceMap();

        for (var nextMan : remainingNodes) {
            if (currentMan.equals(nextMan)) continue;

            Integer distance = manDistanceMap.get(nextMan);
            if (distance + time >= 26) continue;

            for (var nextElephant : remainingNodes) {
                if (currentElephant.equals(nextElephant)) continue;
                if (nextMan.equals(nextElephant)) continue;
                if (elephantDistanceMap.get(nextElephant) + time >= 26) continue;

                var newBranch = new Route(branch);
                newBranch.setNextMan(nextMan);
                newBranch.setNextElephant(nextElephant);
                branches.add(newBranch);
            }
        }
    }



    public long getAnswer() {
        return answer;
    }



    private class Route {

        private final ArrayList<Node> routeMan = new ArrayList<>();

        private final ArrayList<Node> routeElephant = new ArrayList<>();

        private Node nextMan = null;

        private Node nextElephant = null;

        private final LinkedList<Node> remainingNodes = new LinkedList<>();

        private int growthRate = 0;

        private int archived = 0;

        private int timeMan = 1;

        private int timeElephant = 1;

        private int lastTime = 1;



        public Route(Route toCopy) {
            routeMan.addAll(toCopy.routeMan);
            routeElephant.addAll(toCopy.routeElephant);
            remainingNodes.addAll(toCopy.remainingNodes);
            nextMan = toCopy.nextMan;
            nextElephant = toCopy.nextElephant;
            growthRate = toCopy.growthRate;
            archived = toCopy.archived;
            timeMan = toCopy.timeMan;
            timeElephant = toCopy.timeElephant;
            lastTime = toCopy.lastTime;
        }

        public Route(Node entrance, Node manStart, Node elephantStart) {
            routeMan.add(entrance);
            routeElephant.add(entrance);

            remainingNodes.addAll(allNodes);

            setNextMan(manStart);
            setNextElephant(elephantStart);
        }

        public Route() {

        }



        public int calculateFinalValue() {
            if (routeMan.equals(testAnswerMan) && routeElephant.equals(testAnswerElp)) {
                System.out.println("This should be the best.");
            }

            archived += growthRate * (26 - lastTime);
            timeMan = 26;
            timeElephant = 26;
            return archived;
        }

        public void progressMan(int arriveTime) {
            archived += growthRate * (arriveTime - lastTime);
            growthRate += nextMan.getRate();
            timeMan = arriveTime;
            lastTime = arriveTime;

            if (routeMan.contains(nextMan)) {
                throw new RuntimeException("Only unused nodes should be passed.");
            }

            routeMan.add(nextMan);
            nextMan = null;

            if (routeMan.equals(testAnswerMan) || routeElephant.equals(testAnswerElp)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }

            if (routeMan.equals(testAnswerElp) || routeElephant.equals(testAnswerMan)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }
        }

        public void progressElephant(int arriveTime) {
            archived += growthRate * (arriveTime - lastTime);
            growthRate += nextElephant.getRate();
            timeElephant = arriveTime;
            lastTime = arriveTime;

            if (routeElephant.contains(nextElephant)) {
                throw new RuntimeException("Only unused nodes should be passed.");
            }

            routeElephant.add(nextElephant);
            nextElephant = null;

            if (routeMan.equals(testAnswerMan) || routeElephant.equals(testAnswerElp)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }

            if (routeMan.equals(testAnswerElp) || routeElephant.equals(testAnswerMan)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }
        }

        public void progressBoth(int arriveTime) {
            archived += growthRate * (arriveTime - lastTime);
            growthRate += nextMan.getRate() + nextElephant.getRate();
            timeMan = arriveTime;
            timeElephant = arriveTime;
            lastTime = arriveTime;

            if (routeMan.contains(nextMan) || routeElephant.contains(nextElephant)) {
                throw new RuntimeException("Only unused nodes should be passed.");
            }

            routeMan.add(nextMan);
            routeElephant.add(nextElephant);
            nextMan = null;
            nextElephant = null;

            if (routeMan.equals(testAnswerMan) || routeElephant.equals(testAnswerElp)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }

            if (routeMan.equals(testAnswerElp) || routeElephant.equals(testAnswerMan)) {
                System.out.println("Man: " + routeMan + " Elephant: " + routeElephant);
            }
        }



        public int getArchived() {
            return archived;
        }

        public boolean visitedAllNodes() {
            return remainingNodes.isEmpty() && nextMan == null && nextElephant == null;
        }

        public Node getCurrentMan() {
            return routeMan.get(routeMan.size() - 1);
        }

        public Node getCurrentElephant() {
            return routeElephant.get(routeElephant.size() - 1);
        }

        public int getManEndTime() {
            Integer distance = getCurrentMan().getDistanceMap().get(nextMan);
            return distance + timeMan;
        }

        public int getElephantEndTime() {
            Integer distance = getCurrentElephant().getDistanceMap().get(nextElephant);
            return distance + timeElephant;
        }

        public void setNextMan(Node next) {
            if(!remainingNodes.remove(next)) {
                throw new RuntimeException("Only unused nodes should be passed.");
            }
            nextMan = next;
        }

        public void setNextElephant(Node next) {
            if (!remainingNodes.remove(next)) {
                throw new RuntimeException("Only unused nodes should be passed.");
            }
            nextElephant = next;
        }

    }



    public static void main(String[] args) {
        var day = new Day16Part2Attempt2(RunType.Q);
        System.out.println(day.answer);
    }

}
