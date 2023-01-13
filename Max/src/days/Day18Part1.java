package days;

import days.Day17Common.Direction;
import days.Day17Common.Rock;
import days.Day17Common.RockItr;
import days.Day17Common.WindItr;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;

import static days.Day17Common.applyWind;
import static days.Day17Common.decrementY;

public class Day18Part1 implements GenericDay {

    private final int answer;



    public Day18Part1(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();
    }

    private void readLine(String line) {

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day18Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
