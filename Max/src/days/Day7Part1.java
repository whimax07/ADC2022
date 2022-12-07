package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.regex.Pattern;

public class Day7Part1 implements GenericDay {

    private final int answer = 0;

    private Day7Common.FileTree.Dir current;



    public Day7Part1(RunType runType) {
        File inputFile = getFile(runType, 7);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day7Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
