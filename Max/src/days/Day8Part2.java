package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.function.Consumer;
import java.util.stream.IntStream;

public class Day8Part2 implements GenericDay {

    private int answer = 0;

    private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

    private final ArrayList<ArrayList<Integer>> northViews = new ArrayList<>();

    private final ArrayList<ArrayList<Integer>> eastViews = new ArrayList<>();

    private final ArrayList<ArrayList<Integer>> southViews = new ArrayList<>();

    private final ArrayList<ArrayList<Integer>> westViews = new ArrayList<>();

    private final int width;

    private final int height;



    public Day8Part2(RunType runType) {
        File inputFile = getFile(runType, 8);

        new ReadLines(inputFile, this::eatLine).readFile();

        width = grid.get(0).size();
        height = grid.size();

        Consumer<ArrayList<ArrayList<Integer>>> initViews = matrix -> {
            for (int y = 0; y < height; y++) {
                var row = new ArrayList<Integer>();
                for (int x = 0; x < width; x++) {
                    row.add(-1);
                }
                matrix.add(row);
            }
        };
        initViews.accept(northViews);
        initViews.accept(eastViews);
        initViews.accept(southViews);
        initViews.accept(westViews);

        lookFromNorth();
        lookFromEast();
        lookFromSouth();
        lookFromWest();

        for (int y = 0; y < height; y++) {
            for (int x = 0; x < width; x++) {
                answer = Integer.max(
                        answer,
                        northViews.get(y).get(x) * eastViews.get(y).get(x)
                                * southViews.get(y).get(x) * westViews.get(y).get(x)
                );
            }
        }
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
            var viewChecker = new ViewCount();
            for (int y = 0; y < height; y++) {
                var tree = grid.get(y).get(x);
                @SuppressWarnings("UnnecessaryLocalVariable")
                var pos = y;
                var range = viewChecker.getViewRange(tree, pos);
                northViews.get(y).set(x, range);
            }
        }
    }

    private void lookFromEast() {
        for (int y = 1; y < height - 1; y++) {
            var viewChecker = new ViewCount();
            for (int x = width - 1; x >= 0; x--) {
                var tree = grid.get(y).get(x);
                var pos = width - (x + 1);
                var range = viewChecker.getViewRange(tree, pos);
                eastViews.get(y).set(x, range);
            }
        }
    }

    private void lookFromSouth() {
        for (int x = 1; x < width - 1; x++) {
            var viewChecker = new ViewCount();
            for (int y = height - 1; y >= 0; y--) {
                var tree = grid.get(y).get(x);
                var pos = height - (y + 1);
                var range = viewChecker.getViewRange(tree, pos);
                southViews.get(y).set(x, range);
            }
        }
    }

    private void lookFromWest() {
        for (int y = 1; y < height - 1; y++) {
            var viewChecker = new ViewCount();
            for (int x = 0; x < width - 1; x++) {
                var tree = grid.get(y).get(x);
                @SuppressWarnings("UnnecessaryLocalVariable")
                var pos = x;
                var range = viewChecker.getViewRange(tree, pos);
                westViews.get(y).set(x, range);
            }
        }
    }

    private static class ViewCount {
        private int tallTree = -1;

        private final ArrayList<Integer> distanceMap = new ArrayList<>();



        public int getViewRange(int tree, int pos) {
            if (tallTree == -1) {
                tallTree = tree;
                IntStream.rangeClosed(0, tree).forEach(i -> distanceMap.add(pos));
                return 0;
            }

            if (tree <= tallTree) {
                // The current tree is blocked by a tree we have already seen.
                var viewDistance = pos - distanceMap.get(tree);
                IntStream.rangeClosed(0, tree).forEach(i -> distanceMap.set(i, pos));
                return viewDistance;
            }

            // `tree` is taller than the previously seen tallest tree, `tallTree`.
            tallTree = tree;
            distanceMap.clear();
            IntStream.rangeClosed(0, tree).forEach(i -> distanceMap.add(pos));
            return pos;
        }

    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day8Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
