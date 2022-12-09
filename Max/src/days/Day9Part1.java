package days;

import utils.*;

import java.io.File;
import java.util.*;

public class Day9Part1 implements GenericDay {

    private final int answer;

    private final HashSet<v2i> visitedSpaces = new HashSet<>();

    private v2i head = new v2i(0, 0);

    private v2i tail = new v2i(0, 0);



    public Day9Part1(RunType runType) {
        File inputFile = getFile(runType, 9);

        visitedSpaces.add(tail);
        new ReadLines(inputFile, this::eatLine).readFile();

        answer = visitedSpaces.size();
    }



    private void eatLine(String line) {
        String[] command = line.split(" ");
        assert (command.length == 2);

        var reps = Integer.parseInt(command[1]);
        for (int i = 0; i < reps; i++) {
            switch (command[0]) {
                case "U" -> head = new v2i(head.x(), head.y() + 1);
                case "R" -> head = new v2i(head.x() + 1, head.y());
                case "D" -> head = new v2i(head.x(), head.y() - 1);
                case "L" -> head = new v2i(head.x() - 1, head.y());
            }

            var xd = Math.abs(head.x() - tail.x());
            var yd = Math.abs(head.y() - tail.y());

            if (xd < 2 && yd < 2) continue;

            int xc;
            int yc;

            if (xd == 0 || yd == 0) {
                xc = (head.x() - tail.x()) / 2;
                yc = (head.y() - tail.y()) / 2;
            } else {
                xc = (head.x() - tail.x() > 0) ? 1 : -1;
                yc = (head.y() - tail.y() > 0) ? 1 : -1;
            }

            tail = new v2i(tail.x() + xc, tail.y() + yc);
            visitedSpaces.add(tail);
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day9Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
