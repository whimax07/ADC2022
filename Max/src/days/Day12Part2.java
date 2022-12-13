package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;

public class Day12Part2 implements GenericDay {

    private final ArrayList<String> lines = new ArrayList<>();

    private final int answer;



    public Day12Part2(RunType runType) {
        File inputFile = getFile(runType, 12);

        new ReadLines(inputFile, this::eatLine).readFile();

        var grid = new Grid(lines);

        answer = grid.findRoute();
    }



    private void eatLine(String line) {
        lines.add(line);
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day12Part2(RunType.Q);
        System.out.println(day.answer);
    }


    /**
     * To make this a super set of part 1 make {@link Grid#findRoute()} take a predicate function as an argument that
     * determines if a point on the grid is another start point. For part one pass a function that always returns false.
     * For part 2 pass in a function that checks if the height is zero.
     */
    private static class Grid {

        private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

        private final Stack<v2i> currentLooks = new Stack<>();

        private final Stack<v2i> nextLooks = new Stack<>();

        private final HashMap<v2i, Integer> visitedCells = new HashMap<>();

        private int shortestPath;

        private final int HEIGHT;

        private final int WIDTH;

        private static final int EXIT = -1;

        private static final int ENTREE_HEIGHT = 'z' - 'a';



        public Grid(ArrayList<String> rows) {
            for (var row : rows) {
                parseRow(row);
            }

            WIDTH = grid.get(0).size();
            HEIGHT = grid.size();
            visitedCells.put(currentLooks.get(0), 1);
        }

        private void parseRow(String row) {
            var rowList = new ArrayList<Integer>();
            var rowChars = row.toCharArray();

            for (int i = 0; i < row.length(); i++) {
                var c = rowChars[i];
                if (c == 'S') {
                    currentLooks.add(new v2i(i, grid.size()));
                    rowList.add(0);
                } else if (c == 'E') {
                    rowList.add(EXIT);
                } else {
                    rowList.add(c - 'a');
                }
            }

            grid.add(rowList);
        }



        public int findRoute() {
            shortestPath = WIDTH * HEIGHT;
            shortestPath = checkRoute();

            var startPoints = new ArrayList<v2i>();

            for (int y = 0; y < HEIGHT; y++) {
                var row = grid.get(y);
                for (int x = 0; x < WIDTH; x++) {
                    if (row.get(x) == 0) {
                        startPoints.add(new v2i(x, y));
                    }
                }
            }

            for (var startPoint : startPoints) {
                currentLooks.clear();
                nextLooks.clear();

                currentLooks.add(startPoint);
                var pathLength = checkRoute();
                shortestPath = Integer.min(shortestPath, pathLength);
            }

            return shortestPath;
        }

        private int checkRoute() {
            for (int count = 1; count < shortestPath; count++) {

                for (var current : currentLooks) {
                    var currentHeight = get(current);

                    if (check(moveNorth(current), currentHeight, count)) return count;
                    if (check(moveEast(current), currentHeight, count)) return count;
                    if (check(moveSouth(current), currentHeight, count)) return count;
                    if (check(moveWest(current), currentHeight, count)) return count;
                }

                currentLooks.clear();
                currentLooks.addAll(nextLooks);
                nextLooks.clear();

                // Haven't found the exit and there aren't any more cells to check.
                if (currentLooks.isEmpty()) break;
            }

            return Integer.MAX_VALUE;
        }

        private boolean check(v2i next, int currentHeight, int cycle) {
            if (next != null) {
                if (visitedCells.containsKey(next) && visitedCells.get(next) <= cycle) return false;

                // Have we found the exit, if we have can we access it?
                if (get(next) == EXIT) return currentHeight + 1 >= ENTREE_HEIGHT;

                if (currentHeight + 1 >= get(next)) {
                    nextLooks.add(next);
                    visitedCells.put(next, cycle);
                }

                return false;
            }

            return false;
        }



        private v2i moveNorth(v2i current) {
            if (current.y() == 0) return null;

            return new v2i(current.x(), current.y() - 1);
        }

        private v2i moveEast(v2i current) {
            if (current.x() == WIDTH - 1) return null;

            return new v2i(current.x() + 1, current.y());
        }

        private v2i moveSouth(v2i current) {
            if (current.y() == HEIGHT - 1) return null;

            return new v2i(current.x(), current.y() + 1);
        }

        private v2i moveWest(v2i current) {
            if (current.x() == 0) return null;

            return new v2i(current.x() - 1, current.y());
        }

        private int get(v2i at) {
            return grid.get(at.y()).get(at.x());
        }

        @SuppressWarnings("unused")
        private void printPrgress() {
            var copy = new ArrayList<ArrayList<String>>();
            for (var row : grid) {
                var newRow = new ArrayList<String>();
                for (var v : row) {
                    newRow.add(Character.toString('a' + v));
                }
                copy.add(newRow);
            }

            for (var visited : visitedCells.keySet()) {
                copy.get(visited.y()).set(visited.x(), "*");
            }

            for (var toLookAt : currentLooks) {
                var newChar = Character.toString('A' + get(toLookAt));
                copy.get(toLookAt.y()).set(toLookAt.x(), newChar);
            }

            for (var row : copy) System.out.println(row);
            System.out.println();
        }

    }

}
