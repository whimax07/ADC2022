package days.d1_d10;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.InputMismatchException;

public class Day4Part1 implements GenericDay {

    private int answer = 0;



    public Day4Part1(RunType runType) {
        File inputFile = getFile(runType, 4);

        doTheThing(inputFile);
    }



    private void doTheThing(File inputFile) {
        var lineEater = new ReadLines(inputFile, this::eatLine);
        lineEater.readFile();
    }

    private void eatLine(String line) {
        var ids = line.split(",");
        if (ids.length != 2) {
            throw new InputMismatchException("Expected one comma to split at.");
        }

        var left = ids[0].split("-");
        if (left.length != 2) throw new InputMismatchException("Expected one - to split at.");


        var right = ids[1].split("-");
        if (right.length != 2) throw new InputMismatchException("Expected one - to split at.");

        var leftSideDifference = Integer.parseInt(left[0]) - Integer.parseInt(right[0]);
        var rightSideDifference = Integer.parseInt(left[1]) - Integer.parseInt(right[1]);
        if (leftSideDifference <= 0 && rightSideDifference >= 0
                || leftSideDifference >= 0 && rightSideDifference <= 0) {
            answer ++;
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day4Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
