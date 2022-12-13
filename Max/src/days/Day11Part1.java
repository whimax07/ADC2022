package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;

public class Day11Part1 implements GenericDay {

    private final ArrayList<Integer> answer = new ArrayList<>();



    public Day11Part1(RunType runType) {
        File inputFile = getFile(runType, 10);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {

    }



    public ArrayList<Integer> getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day11Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
