package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.HashSet;

public class Day10Part1 implements GenericDay {

    private final int answer;



    public Day10Part1(RunType runType) {
        File inputFile = getFile(runType, 10);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day10Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
