package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day4Test {

    @Test
    void part1() {
        assertEquals(2, new Day4Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(4, new Day4Part2(RunType.TEST).getAnswer());
    }

}
