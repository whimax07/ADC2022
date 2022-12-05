package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day5Part2 implements GenericDay {

    private final String answer;

    private final Day5Common.Towers tower = new Day5Common.Towers(true);

    private boolean moreBoardToParse = true;



    public Day5Part2(RunType runType) {
        File inputFile = getFile(runType, 5);

        new ReadLines(inputFile, this::eatLine).readFile();
        answer = tower.getTop();
    }



    private void eatLine(String line) {
        if (moreBoardToParse && line.isBlank()) {
            moreBoardToParse = false;
        } else if (moreBoardToParse) {
            tower.addTowerRowScan(line);
        } else {
            tower.makeMove(line);
        }
    }



    public String getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day5Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
