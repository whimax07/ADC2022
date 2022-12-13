package days;

import days.d1_d10.Day1Part1;
import days.d1_d10.Day1Part2;
import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

class Day1Test {

    @Test
    void part1() {
        var day = new Day1Part1(RunType.TEST);
        assertEquals(24000, day.getAnswer());
    }

    @Test
    void part2() {
        var day = new Day1Part2(RunType.TEST);
        assertEquals(45000, day.getAnswer());
    }

}