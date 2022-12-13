package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day10Part1 implements GenericDay {

    private int answer;

    private final Day10Common.CPU cpu = new Day10Common.CPU();



    public Day10Part1(RunType runType) {
        File inputFile = getFile(runType, 10);

        cpu.addHook(
                (cycle, reg) -> cycle % 40 == 20,
                (cycle, reg) -> answer += cycle * reg
        );

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {
        cpu.executeInstruction(line);
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day10Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
