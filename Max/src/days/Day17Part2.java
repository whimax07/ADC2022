package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;

public class Day17Part2 implements GenericDay {

    private int answer = 0;



    public Day17Part2(RunType runType) {
        File inputFile = getFile(runType, 19);

        new ReadLines(inputFile, this::readLine).readFile();
    }

    private void readLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day17Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
