package days;

import days.Day16Coomon.Node;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day16Part1 implements GenericDay {

    private long answer = 0;

    // TODO(Max): We can also add a way to reject paths if we detect a cycle and have been on a more optimum route
    //  before.
//    private HashMap<Node, Integer> activatedValues = new HashMap<>();



    public Day16Part1(RunType runType) {
        File inputFile = getFile(runType, 15);

        Day16Coomon.Graph graph = new Day16Coomon.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        var entrence = graph.getEntrance();

        findBestPath();


    }

    private void findBestPath() {

    }



    public long getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day16Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
