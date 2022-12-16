package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day14Part1 implements GenericDay {

    private final int answer;

    private final Day14Common.SandSim sandSim = new Day14Common.SandSim();



    public Day14Part1(RunType runType) {
        File inputFile = getFile(runType, 14);

        new ReadLines(inputFile, this::eatLine).readFile();

        sandSim.printTerrain();
        answer = sandSim.runSim(sandSim::resolveSandNoFloor);
        sandSim.printTerrain();
    }



    private void eatLine(String line) {
        sandSim.eatLine(line);
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day14Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
