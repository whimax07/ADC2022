package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

public class Day11Part1 implements GenericDay {

    private final ArrayList<Day11Common.Monkey> monkeys = new ArrayList<>();

    private final ArrayList<String> lines = new ArrayList<>();

    private final ArrayList<Integer> answer = new ArrayList<>();



    public Day11Part1(RunType runType) {
        File inputFile = getFile(runType, 11);

        new ReadLines(inputFile, this::eatLine).readFile();
        monkeys.add(new Day11Common.Monkey(lines));

        for (int i = 0; i < 20; i++) {
            for (var monkey : monkeys) {
                var itemsThrown = monkey.takeTurnDecreaseWorry(3);
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



    private void eatLine(String line) {
        if (line.isBlank()) {
            monkeys.add(new Day11Common.Monkey(lines));
            lines.clear();
            return;
        }

        lines.add(line);
    }

    private void calcMonkeyBusiness() {
        var list = new ArrayList<>(answer);
        list.sort(Integer::compareTo);
        Collections.reverse(list);
        System.out.println("Monkey business = " + (list.get(0) * list.get(1)));
    }



    public ArrayList<Integer> getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day11Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
