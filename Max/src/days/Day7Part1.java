package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.Stack;

public class Day7Part1 implements GenericDay {

    private int answer = 0;


    public Day7Part1(RunType runType) {
        File inputFile = getFile(runType, 7);

        var fileTreeBuilder = new Day7Common.BuildFileTree();
        new ReadLines(inputFile, fileTreeBuilder::receiveLine).readFile();

        var folders = new Stack<Day7Common.Dir>();
        folders.add(fileTreeBuilder.getRoot());

        while (!folders.isEmpty()) {
            var folder = folders.pop();
            if (folder.getDirSize() <= 100000) {
                answer += folder.getDirSize();
            }

            folders.addAll(folder.getChildren());
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day7Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
