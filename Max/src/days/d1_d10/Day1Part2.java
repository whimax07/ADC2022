package days.d1_d10;

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
        File inputFile = getFile(runType, 1);

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

    

    public static void main(String[] args) {
        var day = new Day1Part2(RunType.Q);
        System.out.println(day.answer);
    }
    
}
