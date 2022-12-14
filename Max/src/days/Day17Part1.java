package days;

import days.Day17Common.Shapes;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

public class Day17Part1 implements GenericDay {

    private int answer = 0;

    private final Shapes shapeGen = new Shapes();



    public Day17Part1(RunType runType) {
        File inputFile = getFile(runType, 17);

        new ReadLines(inputFile, this::readLine).readFile();
    }

    private void readLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day17Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
