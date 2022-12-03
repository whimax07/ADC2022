package days;

import utils.GenericDay;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;

public class Day1Part1 implements GenericDay {

    private final ArrayList<Integer> values;

    private final int answer;



    public Day1Part1(RunType runType) {
        File inputFile = switch (runType) {
            case PART1 -> getInputFileNamePart1();
            case PART2 -> getInputFileNamePart2();
            case TEST -> getTestInputFileName();
        };

        values = Day1Common.readFile(inputFile);
        answer = findGreatest();
    }



    private int findGreatest() {
        return values.stream().max(Comparator.naturalOrder()).orElseThrow();
    }

    public int getAnswer() {
        return answer;
    }

    @Override
    public String getTaskName() { return "day1_1"; }



    public static void main(String[] args) {
        var day = new Day1Part1(RunType.PART1);
        System.out.println(day.getAnswer());
    }

}
