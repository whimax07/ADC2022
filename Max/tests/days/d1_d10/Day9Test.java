package days.d1_d10;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day9Test {

    @Test
    void part1() {
        assertEquals(13, new Day9Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(1, new Day9Part2(RunType.TEST).getAnswer());
    }

}
