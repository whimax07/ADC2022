package days;

import utils.GenericDay;
import utils.Pair;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.InputMismatchException;

public class Day4Part2 implements GenericDay {

    private int answer = 0;



    public Day4Part2(RunType runType) {
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

        var range1 = new Pair<>(Integer.parseInt(left[0]), Integer.parseInt(left[1]));
        var range2 = new Pair<>(Integer.parseInt(right[0]), Integer.parseInt(right[1]));

        // Rebind helps with reasoning about the logic aka I am doing this for readability.
        var rangeChoice = range1.left() < range2.left();
        var lowRange = (rangeChoice) ? range1 : range2;
        var highRange = (rangeChoice) ? range2 : range1;

        if (highRange.left() - lowRange.right() <= 0) {
            answer ++;
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day4Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
