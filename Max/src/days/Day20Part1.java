package days;

import utils.GenericDay;
import utils.Ring;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class Day20Part1 implements GenericDay {

    private final ArrayList<AtomicInteger> inputs = new ArrayList<>();

    private final Ring<Integer> ring = new Ring<>();

    private final HashMap<AtomicInteger, Ring.Node<Integer>> inputToNode = new HashMap<>();

    private int answer;



    public Day20Part1(RunType runType) {
        File inputFile = getFile(runType, 20);

        new ReadLines(inputFile, this::readLine).readFile();

        makeMaps();
        mix();

        var atomicZero = inputs.stream().filter(x -> x.get() == 0).findFirst().orElseThrow();
        var zero = inputToNode.get(atomicZero);

        var v1 = Ring.get(zero, 1000).getValue();
        var v2 = Ring.get(zero, 2000).getValue();
        var v3 = Ring.get(zero, 3000).getValue();
        answer = v1 + v2 + v3;
    }

    private void readLine(String line) {
        inputs.add(new AtomicInteger(Integer.parseInt(line)));
    }

    private void makeMaps() {
        for (var value : inputs) {
            inputToNode.put(value, ring.pushBack(value.get()));
        }
    }

    private void mix() {
        for (var val : inputs) {
            var node = inputToNode.get(val);
            move(node, val.get());
        }
    }

    void move(Ring.Node<Integer> node, int spaces) {
        if (spaces == 0) return;

        var destNode = Ring.get(node, spaces);
        if (spaces >= 0) {
            ring.insertAfter(destNode, node);
        } else {
            ring.insertBefore(destNode, node);
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day20Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
