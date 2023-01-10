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
 *     Github joshuaruegge / adventofcode </a>. I have changed a little, and it now runs a second faster on my
 *     machine. (Original 3.7s ish, mine 2.6s ish).
 */
public class Day16Part2Attempt4 implements GenericDay {

    private final Node entrance;

    private final ArrayList<Node> allNodes;

    private final int numNodes;

    private final int MAX_MASK;

    private final HashMap<Integer, Integer> rateMap = new HashMap<>();

    /**
     *  Dimensions are form left to right: <ol>
     *  <li> Time. </li> <li> Last visited node. </li> <li> Bitfield representing the active nodes. </li>
     *  </ol>
     */
    private final int[][][] scoreArray;

    private final long answer;



    public Day16Part2Attempt4(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var completeGraph = new Day16Common.CompleteGraph(graph);
        entrance = completeGraph.getEntrance();
        allNodes = completeGraph.getNodes();
        allNodes.sort(Comparator.comparingInt(Node::getRate));
        numNodes = allNodes.size();
        MAX_MASK = 1 << numNodes;

        scoreArray = new int[27][numNodes][MAX_MASK];
        System.out.println("The score array has " + 27 * numNodes * MAX_MASK + " elements.");
        populateScoreArray();

        answer = calculateBestScore();
    }

    public int calculateRate(int valuesOpen) {
        var rate = 0;

        for (Node node : allNodes) {
            if ((valuesOpen & 1) == 1) {
                rate += node.getRate();
            }

            valuesOpen = valuesOpen >> 1;
        }

        return rate;
    }

    private void populateScoreArray()  {
        // Prefill the array with min int. Later we will set the value of reachable paths to something greater than
        // zero. We can use the difference between int min and the set value to excluded paths that cannot be reached
        // because we will find an answer by looking for maximum values.
        for (var block : scoreArray) {
            for (var row : block) {
                Arrays.fill(row, Integer.MIN_VALUE);
            }
        }

        // Init the array with routes that we know are valid. Such invited values will be preferred over
        // Integer.MIN_VALUE.
        for (int destIndex = 0; destIndex < allNodes.size(); destIndex++) {
            Node node = allNodes.get(destIndex);
            var time2Open = entrance.getTimeToOpen(node);
            scoreArray[time2Open][destIndex][1 << destIndex] = 0;
        }

        // The traversal route doesn't matter, so we can use this nested loop.
        for (int time = 1; time < 27; time++) {
            for (int currentNode = 0; currentNode < numNodes; currentNode++) {
                for (int openNodes = 0; openNodes < MAX_MASK; openNodes++) {
                    updateScoreArray(time, currentNode, openNodes);
                }
            }
        }
    }

    private void updateScoreArray(int time, int currentNodeIndex, int openNodesMask) {
        int pressureReleaseRate = rateMap.computeIfAbsent(openNodesMask, this::calculateRate);
        int accumulatedScore = scoreArray[time - 1][currentNodeIndex][openNodesMask] + pressureReleaseRate;

        // This score may have been populated by looking at the destinations of a know valid route and therefore
        // "time - 1" may not have been populated. Hence, we can't just increment "time - 1" by the pressure release
        // of the open values.
        int currentScore = scoreArray[time][currentNodeIndex][openNodesMask];

        scoreArray[time][currentNodeIndex][openNodesMask] = Integer.max(currentScore, accumulatedScore);

        // If the currentNodeIndex is not open, continue. (We don't want to add successors.)
        var currentNodeMask = 1 << currentNodeIndex;
        if ((currentNodeMask & openNodesMask) == 0) return;

        var currentNode = allNodes.get(currentNodeIndex);

        // Populate the scoreArray with the destinations of the current node as they are valid routes.
        for (int nextNodeIndex = 0; nextNodeIndex < numNodes; nextNodeIndex++) {

            var nextNodeMask = 1 << nextNodeIndex;
            if ((nextNodeMask & openNodesMask) != 0) continue;

            var timeToOpen = currentNode.getTimeToOpen(allNodes.get(nextNodeIndex));
            if (time + timeToOpen > 26) continue;

            var newOpenNodeMask = openNodesMask | nextNodeMask;
            var travelPressure = (timeToOpen * pressureReleaseRate) + scoreArray[time][currentNodeIndex][openNodesMask];

            scoreArray[time + timeToOpen][nextNodeIndex][newOpenNodeMask] = Integer.max(
                    scoreArray[time + timeToOpen][nextNodeIndex][newOpenNodeMask],
                    travelPressure
            );
        }
    }

    private int calculateBestScore() {
        var bestScore = 0;

        for (int m = 1; m < MAX_MASK; m++) {
            for (int n = 1; n < MAX_MASK; n++) {
                // Make sure n is a subset of m.
                if ((m & n) != n) continue;

                var best1 = 0;
                var best2 = 0;

                for (int endingNodeIndex = 0; endingNodeIndex < numNodes; endingNodeIndex++) {
                    // The node we end on must have been visited otherwise there should have been a better solution.
                    if (((1 << endingNodeIndex) & m) == 0) continue;

                    best1 = Integer.max(best1, scoreArray[26][endingNodeIndex][m ^ n]);
                    best2 = Integer.max(best2, scoreArray[26][endingNodeIndex][n]);
                }

                bestScore = Integer.max(bestScore, best1 + best2);
            }
        }

        return bestScore;
    }



    public long getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day16Part2Attempt4(RunType.Q);
        System.out.println(day.answer);
    }

}
