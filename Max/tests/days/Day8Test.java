package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day8Test {

    @Test
    void part1() {
        assertEquals(21, new Day8Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(8, new Day8Part2(RunType.TEST).getAnswer());
    }

}
