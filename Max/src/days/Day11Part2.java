package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

public class Day11Part2 implements GenericDay {

    private final ArrayList<Day11Common.Monkey> monkeys = new ArrayList<>();

    private final ArrayList<String> lines = new ArrayList<>();

    private final ArrayList<Integer> answer = new ArrayList<>();



    public Day11Part2(RunType runType) {
        File inputFile = getFile(runType, 11);

        new ReadLines(inputFile, this::eatLine).readFile();
        monkeys.add(new Day11Common.Monkey(lines));

        long gcd = 1;
        for (var monkey : monkeys) {
            gcd *= monkey.getTestMod();
        }

        for (int i = 0; i < 10000; i++) {
            for (var monkey : monkeys) {
                var itemsThrown = monkey.takeTurnMod(gcd);
                for (var item : itemsThrown) {
                    monkeys.get(item.toMonkey()).giveItem(item.item());
                }
            }
        }

        for (var monkey : monkeys) {
            answer.add(monkey.getInspectCount());
        }

        calcMonkeyBusiness();
    }



    private void calcMonkeyBusiness() {
        var list = new ArrayList<>(answer);
        list.sort(Integer::compareTo);
        Collections.reverse(list);
        System.out.println("Monkey business = " + ((long) list.get(0) * (long) list.get(1)));
    }

    private void eatLine(String line) {
        if (line.isBlank()) {
            monkeys.add(new Day11Common.Monkey(lines));
            lines.clear();
            return;
        }

        lines.add(line);
    }



    public ArrayList<Integer> getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day11Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
