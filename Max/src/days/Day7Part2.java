package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Stack;

public class Day7Part2 implements GenericDay {

    private final long answer;



    public Day7Part2(RunType runType) {
        File inputFile = getFile(runType, 7);

        var fileTreeBuilder = new Day7Common.BuildFileTree();
        new ReadLines(inputFile, fileTreeBuilder::receiveLine).readFile();

        var root = fileTreeBuilder.getRoot();
        var spaceNeeded = 30000000 - (70000000 - root.getDirSize());

        var folders = new ArrayList<Day7Common.Dir>();
        var toGet = new Stack<Day7Common.Dir>();
        toGet.add(root);

        while (!toGet.empty()) {
            var current = toGet.pop().getChildren();
            var bigEnough = current.stream().filter(x -> x.getDirSize() >= spaceNeeded).toList();
            folders.addAll(bigEnough);
            toGet.addAll(bigEnough);
        }

        folders.sort(Comparator.comparingLong(Day7Common.Dir::getDirSize));
        answer = folders.get(0).getDirSize();
    }



    public long getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day7Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
