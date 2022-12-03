package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.*;

class Day3Test {

    @Test
    void getItemPriority() {
        assertEquals(1, Day3Part1.getItemPriority('a'));
        assertEquals(6, Day3Part1.getItemPriority('f'));
        assertEquals(26, Day3Part1.getItemPriority('z'));
        assertEquals(27, Day3Part1.getItemPriority('A'));
        assertEquals(35, Day3Part1.getItemPriority('I'));
        assertEquals(52, Day3Part1.getItemPriority('Z'));
    }

    @Test
    void part1() {
        assertEquals(157, new Day3Part1(RunType.TEST).getAnswer());
    }

}