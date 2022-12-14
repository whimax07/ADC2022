package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day17Test {

    @Test
    void part1() {
        assertEquals(1651, new Day17Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assert false;  // ===================  Need to add.  ===================
        assertEquals(1707, new Day17Part2(RunType.TEST).getAnswer());
    }

}
