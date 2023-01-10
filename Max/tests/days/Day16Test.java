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
    void part2Attempt4() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(1707, new Day16Part2Attempt4(RunType.TEST).getAnswer());
    }

    @Test
    void calculateRoute() {
        var attempt4 = new Day16Part2Attempt4(RunType.TEST);
        assertEquals(0, attempt4.calculateRate(0));
        assertEquals(2, attempt4.calculateRate(1));
        assertEquals(5, attempt4.calculateRate(3));
        assertEquals(22, attempt4.calculateRate(1 << 5));
    }

}
