package days;

import days.Day16Common.Node;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Stack;

public class Day16Part2Attempt3 implements GenericDay {

    private final Node entrance;

    private final ArrayList<Node> allNodes;

    private final long answer;

    // NOTE(Max): Every node is at least two away from each other as that is one distance and one to open a valve.
    //  So to travel to a new node (travel and open a valve) and gain benefits you need at least three units of time.
    private static final int EFFECTIVE_END_TIME = 26 - 2;



    public Day16Part2Attempt3(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var completeGraph = new Day16Common.CompleteGraph(graph);
        entrance = completeGraph.getEntrance();
        allNodes = completeGraph.getNodes();

//        answer = constructThePartitions();

        var set1 = new ArrayList<Node>();
        set1.add(completeGraph.getNode("JJ"));
        set1.add(completeGraph.getNode("BB"));
        set1.add(completeGraph.getNode("CC"));

        var set2 = new ArrayList<Node>();
        set2.add(completeGraph.getNode("DD"));
        set2.add(completeGraph.getNode("HH"));
        set2.add(completeGraph.getNode("EE"));

        answer = calculateScore(set1, set2);
        System.out.println("Score: " + answer);
    }

    private int constructThePartitions() {
        var lastSets = new Stack<DisjointSets>();
        var currentSets = new Stack<DisjointSets>();
        int max = 0;

        lastSets.add(new DisjointSets(new ArrayList<>(), new ArrayList<>(allNodes)));



        for (int i = 1; i < allNodes.size() / 2; i++) {
            while (!lastSets.isEmpty()) {
                var last = lastSets.pop();

                for (var right : last.set2) {
                    var newSet1 = new ArrayList<>(last.set1);
                    newSet1.add(right);
                    var newSet2 = new ArrayList<>(last.set2);
                    newSet2.remove(right);
                    var sets = new DisjointSets(newSet1, newSet2);
                    max = getMax(max, newSet1, newSet2);
                    currentSets.add(sets);
                }
            }
            lastSets.addAll(currentSets);
        }

        while (!lastSets.isEmpty()) {
            var last = lastSets.pop();

            for (var right : last.set2) {
                var newSet1 = new ArrayList<>(last.set1);
                newSet1.add(right);
                var newSet2 = new ArrayList<>(last.set2);
                newSet2.remove(right);
                max = getMax(max, newSet1, newSet2);
            }
        }

        return max;
    }

    private int getMax(int max, ArrayList<Node> newSet1, ArrayList<Node> newSet2) {
        int newScore = calculateScore(newSet1, newSet2);
        if (newScore > max) {
            max = newScore;
            System.out.println("Set 1: " + newSet1 + ", Set 2: " + newSet2);
        }
        return max;
    }


    private int calculateScore(ArrayList<Node> path1, ArrayList<Node> path2) {
        int lastTime = 0;
        int score = 0;
        int rate = 0;
        var lastNode1 = entrance;
        var lastNode2 = entrance;
        var itr1 = path1.iterator();
        var itr2 = path2.iterator();
        var node1 = itr1.next();
        var node2 = itr2.next();
        int opensAt1 = lastNode1.getTimeToOpen(node1);
        int opensAt2 = lastNode2.getTimeToOpen(node2);


        while (opensAt1 < 26 || opensAt2 < 26) {
            if (opensAt1 < opensAt2) {
                score += rate * (opensAt1 - lastTime);
                lastTime = opensAt1;
                rate += node1.getRate();

                if (itr1.hasNext()) {
                    lastNode1 = node1;
                    node1 = itr1.next();
                    opensAt1 += lastNode1.getTimeToOpen(node1);
                } else {
                    opensAt1 = 26;
                }


            } else if (opensAt1 > opensAt2) {
                score += rate * (opensAt2 - lastTime);
                lastTime = opensAt2;
                rate += node2.getRate();

                if (itr2.hasNext()) {
                    lastNode2 = node2;
                    node2 = itr2.next();
                    opensAt2 += lastNode2.getTimeToOpen(node2);
                } else {
                    opensAt2 = 26;
                }


            } else {
                score += rate * (opensAt1 - lastTime);
                lastTime = opensAt1;
                rate += node1.getRate();
                rate += node2.getRate();

                if (itr1.hasNext()) {
                    lastNode1 = node1;
                    node1 = itr1.next();
                    opensAt1 += lastNode1.getTimeToOpen(node1);
                } else {
                    opensAt1 = 26;
                }

                if (itr2.hasNext()) {
                    lastNode2 = node2;
                    node2 = itr2.next();
                    opensAt2 += lastNode2.getTimeToOpen(node2);
                } else {
                    opensAt2 = 26;
                }
            }

        }

        score += rate * (26 - lastTime);

        return score;
    }



    public long getAnswer() {
        return answer;
    }



    // NOTE(Max): If this blows out the Ram usage we can look at a bit field impl.
    private record DisjointSets(ArrayList<Node> set1, ArrayList<Node> set2) {  }



    public static void main(String[] args) {
        var day = new Day16Part2Attempt3(RunType.Q);
        System.out.println(day.answer);
    }

}
