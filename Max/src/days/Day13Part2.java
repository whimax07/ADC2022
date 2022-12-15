package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;

import static days.Day13Common.parse;

public class Day13Part2 implements GenericDay {

    private final int answer;

    private final ArrayList<Day13Common.PList> pLists = new ArrayList<>();



    public Day13Part2(RunType runType) {
        File inputFile = getFile(runType, 13);

        new ReadLines(inputFile, this::eatLine).readFile();

        var vals = new int[] {2, 6};
        Day13Common.PList divider1 = new Day13Common.PList(null);
        Day13Common.PList divider2 = new Day13Common.PList(null);

        for (var v : vals) {
            var pList = new Day13Common.PList(null);
            pList.add(new Day13Common.PInt(v));
            if (v == 2) divider1.add(pList);
            if (v == 6) divider2.add(pList);
        }

        pLists.add(divider1);
        pLists.add(divider2);

        pLists.sort((left, right) -> switch (compare(left, right)) {
            case TRUE -> -1;
            case FALSE -> 1;
            case CONTINUE -> 0;
        });

        answer = (pLists.indexOf(divider1) + 1) * (pLists.indexOf(divider2) + 1);
    }



    private void eatLine(String line) {
        if (line.isBlank()) return;
        pLists.add(parse(line));
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



    private enum ComRes { TRUE, FALSE, CONTINUE }



    public static void main(String[] args) {
        var day = new Day13Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
