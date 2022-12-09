package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

public class Day7Part1 implements GenericDay {

    private final long answer;


    public Day7Part1(RunType runType) {
        File inputFile = getFile(runType, 7);

        var fileTreeBuilder = new Day7Common.BuildFileTree();
        new ReadLines(inputFile, fileTreeBuilder::receiveLine).readFile();

//        for (var folder : fileTreeBuilder.getRoot()) {
//            if (folder.getDirSize() <= 100000) {
//                answer += folder.getDirSize();
//            }
//        }

        // NOTE(Max): This isn't great but I want to show stream works.
        answer = fileTreeBuilder.getRoot().stream()
                .mapToLong(Day7Common.Dir::getDirSize)
                .filter(x -> x <= 100000)
                .sum();

    }



    public long getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day7Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
