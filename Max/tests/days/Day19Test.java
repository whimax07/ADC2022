package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day19Test {

    @Test
    void part1() {
        assertEquals(33, new Day19Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assert false;  // ===================  Need to add.  ===================
        assertEquals(0, new Day19Part2(RunType.TEST).getAnswer());
    }

}
