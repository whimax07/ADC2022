package days;

import utils.GenericDay;
import utils.Ring;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

public class Day20Part1 implements GenericDay {

    private final ArrayList<Integer> inputs = new ArrayList<>();

    private final Ring<Integer> ring = new Ring<>();

    private final HashMap<Integer, Ring.Node<Integer>> inputToNode = new HashMap<>();

    private final int answer;



    public Day20Part1(RunType runType) {
        File inputFile = getFile(runType, 20);

        new ReadLines(inputFile, this::readLine).readFile();

        makeMaps();
        mix();

        var zero = inputToNode.get(0);
        int zerosIndex = ring.getIndex(zero).orElseThrow();

        answer = ring.get((zerosIndex + 1000) % ring.size())
                + ring.get((zerosIndex + 2000) % ring.size())
                + ring.get((zerosIndex + 3000) % ring.size());
    }

    private void readLine(String line) {
        inputs.add(Integer.parseInt(line));
    }

    private void makeMaps() {
        for (var value : inputs) {
            inputToNode.put(value, ring.pushBack(value));
        }
    }

    private void mix() {
        System.out.println(ring);
        for (var val : inputs) {
            var node = inputToNode.get(val);
            move(node, val);
            System.out.println(ring);
        }
    }

    private void move(Ring.Node<Integer> node, int spaces) {
        if (spaces == 0) return;

        int steps = (spaces > 0) ? spaces : ring.size() + spaces - 1;
        var predecessor = Ring.get(node, steps);
        ring.insertAfter(predecessor, node);
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day20Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
