package days;

import days.Day19Common.Blueprint;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day19Part1 implements GenericDay {

    private int answer = 0;


    public Day19Part1(RunType runType) {
        File inputFile = getFile(runType, 19);

        var blueprintParser = new Day19Common.BlueprintParser();
        new ReadLines(inputFile, blueprintParser::readLine).readFile();
        var blueprints = blueprintParser.getBlueprints();

        for (int i = 0; i < blueprints.size(); i++) {
            var maxGeodes = calcMaxGeodes(blueprints.get(i));
            answer += maxGeodes * (i + 1);
        }
    }

    private int calcMaxGeodes(Blueprint blueprint) {
        return 1;
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day19Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
