package days;

import days.d1_d10.Day6Part1;
import days.d1_d10.Day6Part2;
import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day6Test {

    @Test
    void part1() {
        var answers = new Day6Part1(RunType.TEST).getAnswer();
        assertEquals(5, answers.size());

        assertEquals(7, answers.get(0));
        assertEquals(5, answers.get(1));
        assertEquals(6, answers.get(2));
        assertEquals(10, answers.get(3));
        assertEquals(11, answers.get(4));
    }

    @Test
    void part2() {
        var answers = new Day6Part2(RunType.TEST).getAnswer();
        assertEquals(5, answers.size());

        assertEquals(19, answers.get(0));
        assertEquals(23, answers.get(1));
        assertEquals(23, answers.get(2));
        assertEquals(29, answers.get(3));
        assertEquals(26, answers.get(4));
    }

}
