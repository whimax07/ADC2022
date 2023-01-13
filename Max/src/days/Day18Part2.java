package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day18Part2 implements GenericDay {

    private final int answer;



    public Day18Part2(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();
    }

    private void readLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day18Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
