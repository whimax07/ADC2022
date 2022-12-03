package days;

import utils.GenericDay;
import utils.RunType;

import java.io.File;

public class Day2Part1 implements GenericDay {

    private int answer = 0;



    public Day2Part1(RunType runType) {
        File inputFile = switch (runType) {
            case PART1 -> getInputFileNamePart1();
            case PART2 -> getInputFileNamePart2();
            case TEST -> getTestInputFileName();
        };

        var rounds = Day2Common.readFile(inputFile, Day2Part1::makeRound);
        for (var x : rounds) {
            answer += x.getScore();
        }
    }

    private static Day2Common.Round makeRound(String roundText) {
        var opShape = switch (roundText.charAt(0)) {
            case 'A' -> Day2Common.ROCK;
            case 'B' -> Day2Common.PAPER;
            case 'C' -> Day2Common.SCISSORS;
            default -> throw new RuntimeException("Unimplemented option.");
        };

        var myShape = switch (roundText.charAt(2)) {
            case 'X' -> Day2Common.ROCK;
            case 'Y' -> Day2Common.PAPER;
            case 'Z' -> Day2Common.SCISSORS;
            default -> throw new RuntimeException("Unimplemented option.");
        };

        return new Day2Common.Round(myShape, opShape);
    }

    public int getAnswer() {
        return answer;
    }

    @Override
    public String getTaskName() {
        return "day2_1";
    }



    public static void main(String[] args) {
        var day = new Day2Part1(RunType.PART1);
        System.out.println(day.answer);
    }

}
