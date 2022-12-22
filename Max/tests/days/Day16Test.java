package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day16Test {

    @Test
    void part1() {
        assertEquals(1651, new Day16Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2Attempt1() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(1707, new Day16Part2Attempt1(RunType.TEST).getAnswer());
    }

    @Test
    void part2Attempt2() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(1707, new Day16Part2Attempt2(RunType.TEST).getAnswer());
    }

}
