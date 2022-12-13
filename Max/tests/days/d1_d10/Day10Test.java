package days.d1_d10;

import org.junit.jupiter.api.Test;
import utils.RunType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Day10Test {

    @Test
    void part1() {
        assertEquals(13140, new Day10Part1(RunType.TEST).getAnswer());
    }

    @Test
    void part2() {
        assertEquals(
                """
                ##..##..##..##..##..##..##..##..##..##..
                ###...###...###...###...###...###...###.
                ####....####....####....####....####....
                #####.....#####.....#####.....#####.....
                ######......######......######......####
                #######.......#######.......#######.....
                """, new Day10Part2(RunType.TEST).getAnswer());
    }

}
