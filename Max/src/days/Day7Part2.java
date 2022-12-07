package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day7Part2 implements GenericDay {

    private final int answer = 0;



    public Day7Part2(RunType runType) {
        File inputFile = getFile(runType, 7);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day7Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
