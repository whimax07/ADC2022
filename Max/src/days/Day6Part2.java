package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.function.BiConsumer;

public class Day6Part2 implements GenericDay {

    private final ArrayList<Integer> answer = new ArrayList<>();

    private final static int NUM_LETTERS = 14;



    public Day6Part2(RunType runType) {
        File inputFile = getFile(runType, 6);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {
        if (line.length() < NUM_LETTERS) throw new InputMismatchException("The input is to short.");

        var lineArray = line.toCharArray();

        final var charsUsed = new HashMap<Character, Integer>();

        for (char c : line.substring(0, NUM_LETTERS).toCharArray()) {
            if (charsUsed.containsKey(c)) {
                charsUsed.put(c, charsUsed.get(c) + 1);
            } else {
                charsUsed.put(c, 1);
            }
        }

        BiConsumer<Character, Character> updateMap = (oldC, newC) -> {
            if (charsUsed.get(oldC) == 1) {
                charsUsed.remove(oldC);
            } else {
                charsUsed.put(oldC, charsUsed.get(oldC) - 1);
            }

            if (charsUsed.containsKey(newC)) {
                charsUsed.put(newC, charsUsed.get(newC) + 1);
            } else {
                charsUsed.put(newC, 1);
            }
        };

        int oldIndex = 0;
        int newIndex = NUM_LETTERS;

        while (newIndex < lineArray.length) {
            updateMap.accept(lineArray[oldIndex], lineArray[newIndex]);

            if (charsUsed.size() == NUM_LETTERS) {
                answer.add(++newIndex);
                return;
            }

            oldIndex ++;
            newIndex ++;
        }

        throw new InputMismatchException("Couldn't find a unique string of " + NUM_LETTERS + " chars.");
    }



    public ArrayList<Integer> getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day6Part2(RunType.Q);
        assert(day.answer.size() == 1);
        System.out.println(day.answer.get(0));
    }

}
