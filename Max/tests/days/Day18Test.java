package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day18Test {

    @Test
    void part1Method1() {
        assertEquals(64, new Day18Part1Method1(RunType.TEST).getAnswer());
    }

    @Test
    void part1Method2() {
        assertEquals(64, new Day18Part1Method2(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
//        assert false;  // ===================  Need to add.  ===================
        assertEquals(58, new Day18Part2(RunType.TEST).getAnswer());
    }

}
