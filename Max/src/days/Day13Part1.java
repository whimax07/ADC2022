package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;

import static days.Day13Common.parse;

public class Day13Part1 implements GenericDay {

    private int answer;

    private int count = 1;

    private State state = State.FIRST;

    private Day13Common.PList list1;

    private Day13Common.PList list2;



    public Day13Part1(RunType runType) {
        File inputFile = getFile(runType, 13);

        new ReadLines(inputFile, this::eatLine).readFile();

        eatLine("");
    }



    private void eatLine(String line) {
        switch (state) {
            case FIRST -> {
                list1 = parse(line);
                state = State.SECOND;
            }
            case SECOND -> {
                list2 = parse(line);
                state = State.THIRD;
            }
            case THIRD -> {
                var result = compare(list1, list2);
                switch (result) {
                    case TRUE -> answer += count;
                    case CONTINUE -> throw new IllegalStateException("Was expecting true or false.");
                }
                count ++;
                state = State.FIRST;
            }
        }
    }

    private ComRes compare(Day13Common.Packet left, Day13Common.Packet right) {
        if (left instanceof Day13Common.PInt lInt && right instanceof Day13Common.PInt rInt) {
            if (lInt.v() < rInt.v()) return ComRes.TRUE;
            if (lInt.v() > rInt.v()) return ComRes.FALSE;
            return ComRes.CONTINUE;
        }

        if (left instanceof Day13Common.PList lList && right instanceof Day13Common.PList rList) {
            var range = Integer.min(lList.size(), rList.size());
            for (int i = 0; i < range; i++) {
                switch (compare(lList.get(i), rList.get(i))) {
                    case TRUE -> {
                        return ComRes.TRUE;
                    }
                    case FALSE -> {
                        return ComRes.FALSE;
                    }
                }
            }

            return (lList.size() < rList.size()) ? ComRes.TRUE :
                    (lList.size() > rList.size()) ? ComRes.FALSE : ComRes.CONTINUE;
        }

        if (left instanceof Day13Common.PList lList && right instanceof Day13Common.PInt rInt) {
            var rList = new Day13Common.PList(null);
            rList.add(rInt);
            return compare(lList, rList);
        }

        if (left instanceof Day13Common.PInt lInt && right instanceof Day13Common.PList rList) {
            var lList = new Day13Common.PList(null);
            lList.add(lInt);
            return compare(lList, rList);
        }

        throw new IllegalStateException("Comparison should have been decided by now.");
    }



    public int getAnswer() {
        return answer;
    }



    private enum State { FIRST, SECOND, THIRD }

    private enum ComRes { TRUE, FALSE, CONTINUE }



    public static void main(String[] args) {
        var day = new Day13Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
