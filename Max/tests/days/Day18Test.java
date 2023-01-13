package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day18Test {

    @Test
    void part1() {
        assertEquals(64, new Day17Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assert false;  // ===================  Need to add.  ===================
        assertEquals(1514285714288L, new Day17Part2(RunType.TEST).getAnswer());
    }

}
