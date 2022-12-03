package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.*;

class Day3Test {

    @Test
    void getItemPriority() {
        assertEquals(1, Day3Common.getItemPriority('a'));
        assertEquals(6, Day3Common.getItemPriority('f'));
        assertEquals(26, Day3Common.getItemPriority('z'));
        assertEquals(27, Day3Common.getItemPriority('A'));
        assertEquals(35, Day3Common.getItemPriority('I'));
        assertEquals(52, Day3Common.getItemPriority('Z'));
    }

    @Test
    void part1() {
        assertEquals(157, new Day3Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(70, new Day3Part2(RunType.TEST).getAnswer());
    }

}