package days;

import utils.GenericDay;
import utils.RunType;

import java.io.File;

public class Day2Part2 implements GenericDay {

    private int answer = 0;



    public Day2Part2(RunType runType) {
        File inputFile = getFile(runType, 2);

        var rounds = Day2Common.readFile(inputFile, Day2Part2::makeRound);
        for (var x : rounds) {
            answer += x.getScore();
        }
    }

    public static Day2Common.Round makeRound(String roundText) {
        var opShape = switch (roundText.charAt(0)) {
            case 'A' -> Day2Common.ROCK;
            case 'B' -> Day2Common.PAPER;
            case 'C' -> Day2Common.SCISSORS;
            default -> throw new RuntimeException("Unimplemented option.");
        };

        var result = switch (roundText.charAt(2)) {
            // Need to lose.
            case 'X' -> -1;
            // Need to draw.
            case 'Y' -> 0;
            // Need to win.
            case 'Z' -> 1;
            default -> throw new RuntimeException("Unimplemented option.");
        };

        // The order is Rock -> Paper -> Scissors -> Rock so move forward, backwards or say the same depending on what
        // you need to do.
        var in = (result + opShape.val() - 1) % 3;
        in = (in < 0) ? in + 3 : in;

        var myShape = switch (in) {
            case 0 -> Day2Common.ROCK;
            case 1 -> Day2Common.PAPER;
            case 2 -> Day2Common.SCISSORS;
            default -> throw new IllegalStateException("Unexpected value: " + in);
        };

        return new Day2Common.Round(myShape, opShape);
    }

    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day2Part2(RunType.PART2);
        System.out.println(day.answer);
    }

}
