package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import java.util.ArrayList;
import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day11Test {

    @Test
    void part1() {
//        fail("\n\n===================  Need to add.  ===================\n");
        assertEquals(
                new ArrayList<>(Arrays.asList(101, 95, 7, 105)),
                new Day11Part1(RunType.TEST).getAnswer()
        );
    }

    @Test
    void part2() {
//        fail("\n\n===================  Need to add.  ===================\n");
        assertEquals(
                new ArrayList<>(Arrays.asList(52166, 47830, 1938, 52013)),
                new Day11Part2(RunType.TEST).getAnswer()
        );
    }

}
