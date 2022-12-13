package days.d1_d10;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day5Test {

    @Test
    void part1() {
        assertEquals("CMZ", new Day5Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals("MCD", new Day5Part2(RunType.TEST).getAnswer());
    }

}
