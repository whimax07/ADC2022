package days;

import utils.GenericDay;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Day1Part2 implements GenericDay {

    private final ArrayList<Integer> values;

    private final int answer;



    public Day1Part2(RunType runType) {
        File inputFile = switch (runType) {
            case PART1 -> getInputFileNamePart1();
            case PART2 -> getInputFileNamePart2();
            case TEST -> getTestInputFileName();
        };

        values = Day1Common.readFile(inputFile);
        answer = sumOfGreatest3();
    }



    public int sumOfGreatest3() {
        values.sort(Comparator.naturalOrder());
        Collections.reverse(values);
        return values.get(0) + values.get(1) + values.get(2);
    }

    public int getAnswer() {
        return answer;
    }

    @Override
    public String getTaskName() {
        return "Day1_2";
    }

    

    public static void main(String[] args) {
        var day = new Day1Part2(RunType.PART2);
        System.out.println(day.answer);
    }
    
}
