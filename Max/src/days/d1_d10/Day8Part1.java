package days.d1_d10;

import utils.GenericDay;
import utils.Pair;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;

public class Day8Part1 implements GenericDay {

    private int answer;

    private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

    private final int width;

    private final int hight;

    private final HashSet<Pair<Integer, Integer>> counted = new HashSet<>();



    public Day8Part1(RunType runType) {
        File inputFile = getFile(runType, 8);

        new ReadLines(inputFile, this::eatLine).readFile();

        width = grid.get(0).size();
        hight = grid.size();

        lookFromNorth();
        lookFromEast();
        lookFromSouth();
        lookFromWest();

        // Add the corners.
        answer += 4;
    }



    private void eatLine(String line) {
        var row = new ArrayList<Integer>();
        for (var c : line.toCharArray()) {
            row.add(c - '0');
        }
        grid.add(row);
    }

    private void lookFromNorth() {
        for (int x = 1; x < width - 1; x++) {
            int lastTree = -1;
            for (int y = 0; y < hight; y++) {
                lastTree = isNewlyVisibleTree(grid.get(y).get(x), lastTree, x, y);

                if (lastTree >= 9) break;
            }
        }
    }

    private void lookFromEast() {
        for (int y = 1; y < hight - 1; y++) {
            int lastTree = -1;
            for (int x = width - 1; x >= 0; x--) {
                lastTree = isNewlyVisibleTree(grid.get(y).get(x), lastTree, x, y);

                if (lastTree >= 9) break;
            }
        }
    }

    private void lookFromSouth() {
        for (int x = 1; x < width - 1; x++) {
            int lastTree = -1;
            for (int y = hight - 1; y >= 0; y--) {
                lastTree = isNewlyVisibleTree(grid.get(y).get(x), lastTree, x, y);

                if (lastTree >= 9) break;
            }
        }
    }

    private void lookFromWest() {
        for (int y = 1; y < hight - 1; y++) {
            int lastTree = -1;
            for (int x = 0; x < width - 1; x++) {
                lastTree = isNewlyVisibleTree(grid.get(y).get(x), lastTree, x, y);

                if (lastTree >= 9) break;
            }
        }
    }

    private int isNewlyVisibleTree(int tree, int lastTree, int x, int y) {
        if (tree <= lastTree) return lastTree;

        //noinspection SuspiciousNameCombination
        var loc = new Pair<>(x, y);

        if (!counted.contains(loc)) {
            answer++;
            counted.add(loc);
        }

        return tree;
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day8Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
