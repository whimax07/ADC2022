package days;

import org.junit.jupiter.api.Test;
import utils.RunType;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

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
        fail("\n\n===================  Need to add.  ===================\n");
        assertEquals(0, new Day11Part2(RunType.TEST).getAnswer());
    }

}
