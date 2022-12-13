package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day10Part2 implements GenericDay {

    private final Day10Common.CPU cpu = new Day10Common.CPU();

    private final StringBuilder answer = new StringBuilder();

    private int displayPos = 0;



    public Day10Part2(RunType runType) {
        File inputFile = getFile(runType, 10);

        cpu.addHook(
                (cycle, reg) -> true,
                this::genDisplay
        );

        new ReadLines(inputFile, this::eatLine).readFile();
    }

    private void genDisplay(long cycle, int reg) {
        if ((cycle - 1) % 40 == 0) {
            answer.append("\n");
            displayPos = displayPos % 40;
        }

        if (displayPos <= reg + 1 && displayPos >= reg - 1) {
            answer.append("#");
        } else {
            answer.append(".");
        }

        displayPos ++;
    }



    private void eatLine(String line) {
        cpu.executeInstruction(line);
    }



    public String getAnswer() {
        return answer.append("\n").toString().replaceFirst("\n", "");
    }



/*
The answer is RBPARAGF:
###..###..###...##..###...##...##..####.
#..#.#..#.#..#.#..#.#..#.#..#.#..#.#....
#..#.###..#..#.#..#.#..#.#..#.#....###..
###..#..#.###..####.###..####.#.##.#....
#.#..#..#.#....#..#.#.#..#..#.#..#.#....
#..#.###..#....#..#.#..#.#..#..###.#....
 */
    public static void main(String[] args) {
        var day = new Day10Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
