package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day13Test {

    @Test
    void part1() {
        assertEquals(13, new Day13Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(140, new Day13Part2(RunType.TEST).getAnswer());
    }

}
