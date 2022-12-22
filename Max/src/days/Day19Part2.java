package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;

public class Day19Part2 implements GenericDay {

    private int answer = 0;

    private final ArrayList<Day19Common.Blueprint> blueprints;



    public Day19Part2(RunType runType) {
        File inputFile = getFile(runType, 19);

        var blueprintParser = new Day19Common.BlueprintParser();
        new ReadLines(inputFile, blueprintParser::readLine).readFile();
        blueprints = blueprintParser.getBlueprints();

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day19Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
