package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day16Part2 implements GenericDay {

    private long answer = 0;



    public Day16Part2(RunType runType) {
        File inputFile = getFile(runType, 15);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {

    }



    public long getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day16Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
