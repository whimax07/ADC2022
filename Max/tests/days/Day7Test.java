package days;

import days.d1_d10.Day7Part1;
import days.d1_d10.Day7Part2;
import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day7Test {

    @Test
    void part1() {
        assertEquals(95437, new Day7Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(24933642, new Day7Part2(RunType.TEST).getAnswer());
    }

}
