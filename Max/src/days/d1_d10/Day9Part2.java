package days.d1_d10;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.HashSet;
import java.util.InputMismatchException;
import java.util.stream.IntStream;

public class Day9Part2 implements GenericDay {

    private final int answer;

    private final HashSet<v2i> visitedSpaces = new HashSet<>();

    private final v2i[] rope = new v2i[10];

    private final int LAST;



    public Day9Part2(RunType runType) {
        File inputFile = getFile(runType, 9);

        IntStream.range(0, rope.length).forEach(i -> rope[i] = new v2i(0, 0));
        LAST = rope.length - 1;

        visitedSpaces.add(rope[LAST]);
        new ReadLines(inputFile, this::eatLine).readFile();

        answer = visitedSpaces.size();
    }



    private void eatLine(String line) {
        String[] command = line.split(" ");
        assert (command.length == 2);

        var reps = Integer.parseInt(command[1]);
        for (int i = 0; i < reps; i++) {

            var head = rope[0];
            rope[0] = switch (command[0]) {
                case "U" -> new v2i(head.x(), head.y() + 1);
                case "R" -> new v2i(head.x() + 1, head.y());
                case "D" -> new v2i(head.x(), head.y() - 1);
                case "L" -> new v2i(head.x() - 1, head.y());
                default -> throw new InputMismatchException("Only U, R, D and L have been allowed for.");
            };

            for (int section = 1; section < rope.length; section++) {
                rope[section] = moveKnot(rope[section - 1], rope[section]);
            }
            visitedSpaces.add(rope[LAST]);
        }
    }

    private v2i moveKnot(v2i lead, v2i tail) {
        var xd = Math.abs(lead.x() - tail.x());
        var yd = Math.abs(lead.y() - tail.y());

        if (xd < 2 && yd < 2) return tail;

        int xc;
        int yc;

        if (xd == 0 || yd == 0) {
            xc = (lead.x() - tail.x()) / 2;
            yc = (lead.y() - tail.y()) / 2;
        } else {
            xc = (lead.x() - tail.x() > 0) ? 1 : -1;
            yc = (lead.y() - tail.y() > 0) ? 1 : -1;
        }

        return new v2i(tail.x() + xc, tail.y() + yc);
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day9Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
