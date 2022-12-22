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



    public Day16Part2Attempt2(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var completeGraph = new Day16Common.CompleteGraph(graph);
        entrance = completeGraph.getEntrance();
        allNodes = completeGraph.getNodes();

        bestRoute = new Route(entrance);

        findBestPath();

        answer = bestRoute.getArchived();
    }

    private void findBestPath() {
        branches.add(new Route(entrance));


        while (!branches.isEmpty()) {
            followBranch(branches.pop());
        }
    }

    private void followBranch(Route branch) {
        var manEndTime = branch.getManEndTime();
        var elephantEndTime = branch.getElephantEndTime();
        var finished = manEndTime >= EFFECTIVE_END_TIME && elephantEndTime >= EFFECTIVE_END_TIME;

        if (branch.visitedAllNodes() || finished) {
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

        private Node nextMan = entrance;

        private Node nextElephant = entrance;

        private final LinkedList<Node> remainingNodes = new LinkedList<>(allNodes);

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

        public Route(Node entrance) {
//            routeMan.add(entrance);
//            routeElephant.add(entrance);
        }



        public int calculateFinalValue() {
            archived += growthRate * (26 - lastTime);
            timeMan = 26;
            timeElephant = 26;
            return archived;
        }

//        public boolean canExceed(int bestScore) {
//            var mNodes = getCurrentMan().getDistanceMap();
//            var eNodes = getCurrentElephant().getDistanceMap();
//
//            var visited = new HashSet<>(remainingNodes);
//
//            var tm = timeMan;
//            var te = timeElephant;
//
//            while (Integer.min(tm, te) < )
//
//            assert (false);
//            return true;
//        }

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
        }

        public void progressBoth(int arriveTime) {
            archived += growthRate * (arriveTime - lastTime);
            growthRate += nextMan.getRate() + nextElephant.getRate();
            timeMan = arriveTime;
            timeElephant = arriveTime;
            lastTime = arriveTime;

            if (routeMan.contains(nextMan) || routeElephant.contains(nextElephant)) {
                if (nextMan != entrance && nextElephant != entrance) {
                    throw new RuntimeException("Only unused nodes should be passed.");
                }
            }

            routeMan.add(nextMan);
            routeElephant.add(nextElephant);
            nextMan = null;
            nextElephant = null;
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
            if (distance == null) return timeMan;
            return distance + timeMan;
        }

        public int getElephantEndTime() {
            Integer distance = getCurrentElephant().getDistanceMap().get(nextElephant);
            if (distance == null) return timeElephant;
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
