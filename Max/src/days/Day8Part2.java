package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.stream.IntStream;

public class Day8Part2 implements GenericDay {

    private int answer = 0;

    private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

    private final ArrayList<ArrayList<Integer>> views;

    private final int width;

    private final int height;



    public Day8Part2(RunType runType) {
        File inputFile = getFile(runType, 8);

        new ReadLines(inputFile, this::eatLine).readFile();

        width = grid.get(0).size();
        height = grid.size();

        views = new ArrayList<>(height);
        for (int y = 0; y < height; y++) {
            var row = new ArrayList<Integer>(width);
            for (int x = 0; x < width; x++) {
                row.add(1);
            }
            views.add(row);
        }

        // ↑
        viewsLookingNorth();
        // ←
        viewsLookingEast();
        // ↓
        viewsLookingSouth();
        // ←
        viewsLookingWest();

        for (var row : views) {
            for (var view : row) {
                answer = Integer.max(answer, view);
            }
        }

        // Its call to write, but it is hard to work out what's going on.
        /*
        answer = views.stream()
                .flatMap(Collection::stream)
                .max(Integer::compare)
                .orElseThrow();
         */
    }



    private void eatLine(String line) {
        var row = new ArrayList<Integer>();
        for (var c : line.toCharArray()) {
            row.add(c - '0');
        }
        grid.add(row);
    }

    private void viewsLookingSouth() {
        for (int x = 1; x < width - 1; x++) {
            var viewChecker = new ViewCount();
            for (int y = 0; y < height; y++) {
                var range = viewChecker.getViewRange(grid.get(y).get(x));
                views.get(y).set(x, views.get(y).get(x) * range);
            }
        }
    }

    private void viewsLookingWest() {
        for (int y = 1; y < height - 1; y++) {
            var viewChecker = new ViewCount();
            for (int x = width - 1; x >= 0; x--) {
                var range = viewChecker.getViewRange(grid.get(y).get(x));
                views.get(y).set(x, views.get(y).get(x) * range);
            }
        }
    }

    private void viewsLookingNorth() {
        for (int x = 1; x < width - 1; x++) {
            var viewChecker = new ViewCount();
            for (int y = height - 1; y >= 0; y--) {
                var range = viewChecker.getViewRange(grid.get(y).get(x));
                views.get(y).set(x, views.get(y).get(x) * range);
            }
        }
    }

    private void viewsLookingEast() {
        for (int y = 1; y < height - 1; y++) {
            var viewChecker = new ViewCount();
            for (int x = 0; x < width - 1; x++) {
                var range = viewChecker.getViewRange(grid.get(y).get(x));
                views.get(y).set(x, views.get(y).get(x) * range);
            }
        }
    }



    private static class ViewCount {
        private int tallTree = -1;

        private final ArrayList<Integer> distanceMap = new ArrayList<>();

        private int pos = -1;



        public int getViewRange(int tree) {
            pos ++;

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
