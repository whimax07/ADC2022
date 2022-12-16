package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day15Test {

    @Test
    void part1() {
        assertEquals(26, new Day15Part1(RunType.TEST, 10).getAnswer());
    }

    @Test
    void part2() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(56000011, new Day15Part2(RunType.TEST, 20).getAnswer());
    }

}
