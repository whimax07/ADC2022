package days.d1_d10;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day2Test {

    @Test
    void checkPointScore() {
        assertEquals(1, new Day2Common.Round(Day2Common.ROCK, Day2Common.PAPER).getScore());
        assertEquals(4, new Day2Common.Round(Day2Common.ROCK, Day2Common.ROCK).getScore());
        assertEquals(7, new Day2Common.Round(Day2Common.ROCK, Day2Common.SCISSORS).getScore());

        assertEquals(2, new Day2Common.Round(Day2Common.PAPER, Day2Common.SCISSORS).getScore());
        assertEquals(5, new Day2Common.Round(Day2Common.PAPER, Day2Common.PAPER).getScore());
        assertEquals(8, new Day2Common.Round(Day2Common.PAPER, Day2Common.ROCK).getScore());

        assertEquals(3, new Day2Common.Round(Day2Common.SCISSORS, Day2Common.ROCK).getScore());
        assertEquals(6, new Day2Common.Round(Day2Common.SCISSORS, Day2Common.SCISSORS).getScore());
        assertEquals(9, new Day2Common.Round(Day2Common.SCISSORS, Day2Common.PAPER).getScore());
    }

    @Test
    void part1() {
        var day = new Day2Part1(RunType.TEST);
        assertEquals(15, day.getAnswer());
    }


    @Test
    void chooseShape() {
        Day2Common.Round gened;

        gened = Day2Part2.makeRound("A X");
        assertEquals(new Day2Common.Round(Day2Common.SCISSORS, Day2Common.ROCK), gened);
        gened = Day2Part2.makeRound("B X");
        assertEquals(new Day2Common.Round(Day2Common.ROCK, Day2Common.PAPER), gened);
        gened = Day2Part2.makeRound("C X");
        assertEquals(new Day2Common.Round(Day2Common.PAPER, Day2Common.SCISSORS), gened);

        gened = Day2Part2.makeRound("A Y");
        assertEquals(new Day2Common.Round(Day2Common.ROCK, Day2Common.ROCK), gened);
        gened = Day2Part2.makeRound("B Y");
        assertEquals(new Day2Common.Round(Day2Common.PAPER, Day2Common.PAPER), gened);
        gened = Day2Part2.makeRound("C Y");
        assertEquals(new Day2Common.Round(Day2Common.SCISSORS, Day2Common.SCISSORS), gened);

        gened = Day2Part2.makeRound("A Z");
        assertEquals(new Day2Common.Round(Day2Common.PAPER, Day2Common.ROCK), gened);
        gened = Day2Part2.makeRound("B Z");
        assertEquals(new Day2Common.Round(Day2Common.SCISSORS, Day2Common.PAPER), gened);
        gened = Day2Part2.makeRound("C Z");
        assertEquals(new Day2Common.Round(Day2Common.ROCK, Day2Common.SCISSORS), gened);
    }

    @Test
    void part2() {
        var day = new Day2Part2(RunType.TEST);
        assertEquals(12, day.getAnswer());
    }

}
