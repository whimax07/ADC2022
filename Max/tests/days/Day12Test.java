package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day12Test {

    @Test
    void part1() {
        assertEquals(31, new Day12Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
//        fail("\n\n===================  Need to add.  ===================\n");
        assertEquals(29, new Day12Part2(RunType.TEST).getAnswer());
    }

}
