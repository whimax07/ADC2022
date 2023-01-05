package days;

import days.Day16Common.Node;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;

/**
 * This is a copy of this answer I found on Reddit.
 * <a href="https://github.com/joshuaruegge/adventofcode/blob/6a42294b613dce4e031bb06fd737a155ee8d538b/advent/aoc2022/Day16.java">
 *     Github joshuaruegge / adventofcode </a>
 */
public class Day16Part2Attempt4 implements GenericDay {

    private final Node entrance;

    private final ArrayList<Node> allNodes;

    private final int numNodes;

    private final HashMap<Integer, Integer> rateMap = new HashMap<>();

    /**
     *  Dimensions are form left to right: <ol>
     *  <li> Time. </li> <li> Last visited node. </li> <li> Bitfield representing the active nodes. </li>
     *  </ol>
     */
    private final int[][][] scoreArray;

    private final long answer = 0;



    public Day16Part2Attempt4(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var completeGraph = new Day16Common.CompleteGraph(graph);
        entrance = completeGraph.getEntrance();
        allNodes = completeGraph.getNodes();
        allNodes.sort(Comparator.comparingInt(Node::getRate));
        numNodes = allNodes.size();

        scoreArray = new int[27][numNodes][1 << numNodes];
        populateScoreArray();

//        var set1 = new ArrayList<Node>();
//        set1.add(completeGraph.getNode("JJ"));
//        set1.add(completeGraph.getNode("BB"));
//        set1.add(completeGraph.getNode("CC"));
//
//        var set2 = new ArrayList<Node>();
//        set2.add(completeGraph.getNode("DD"));
//        set2.add(completeGraph.getNode("HH"));
//        set2.add(completeGraph.getNode("EE"));
    }

    private int calculateRate(int valuesOpen) {
        var rate = 0;

        for (Node allNode : allNodes) {
            if ((valuesOpen & 1) == 1) {
                rate += allNode.getRate();
            }

            valuesOpen = valuesOpen >> 1;
        }

        return rate;
    }

    private void populateScoreArray() {
        var maxMask = 1 << numNodes;

        // Prefill the array with min int. Later we will set the value of reachable paths to something greater than
        // zero. We can use the difference between int min and the set value to excluded paths that cannot be reached
        // because we will find an answer by looking for maximum values.
        for (var block : scoreArray) {
            for (var row : block) {
                Arrays.fill(row, Integer.MIN_VALUE);
            }
        }

        // The traversal route doesn't matter, so we can use this nested loop.
        for (int time = 1; time < 27; time++) {
            for (int currentNode = 1; currentNode < maxMask; currentNode <<= 1) {
                for (int openNodes = 0; openNodes < maxMask; openNodes++) {
                    updateScoreArray(time, currentNode, openNodes);
                }
            }
        }
    }

    private void updateScoreArray(int time, int currentNode, int openNodes) {

    }



    public long getAnswer() {
        return answer;
    }



    // NOTE(Max): If this blows out the Ram usage we can look at a bit field impl.
    private record DisjointSets(ArrayList<Node> set1, ArrayList<Node> set2) {  }



    public static void main(String[] args) {
        var day = new Day16Part2Attempt4(RunType.Q);
        System.out.println(day.answer);
    }

}
