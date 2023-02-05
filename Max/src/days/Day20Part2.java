package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day20Part2 implements GenericDay {

    private final int answer = 0;



    public Day20Part2(RunType runType) {
        File inputFile = getFile(runType, 20);

        new ReadLines(inputFile, this::readLine).readFile();

    }

    private void readLine(String line) {
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day20Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
