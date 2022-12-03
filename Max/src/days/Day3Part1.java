package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.HashSet;

public class Day3Part1 implements GenericDay {

    private int answer = 0;



    public Day3Part1(RunType runType) {
        File inputFile = getFile(runType, 3);

        doTheThing(inputFile);
    }



    private void doTheThing(File inputFile) {
        var lineEater = new ReadLines(inputFile, this::eatLine);
        lineEater.readFile();
    }

    private void eatLine(String line) {
        String left = line.substring(0, line.length()/2);
        String right = line.substring(line.length()/2);

        var leftItems = new HashSet<Character>();
        for (Character c : left.toCharArray()) {
            leftItems.add(c);
        }

        for (Character c : right.toCharArray()) {
            if (leftItems.contains(c)) {
                answer += Day3Common.getItemPriority(c);
                return;
            }
        }

        throw new RuntimeException("No duplicate items found.");
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day3Part1(RunType.PART1);
        System.out.println(day.answer);
    }

}
