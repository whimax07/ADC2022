package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Stack;

public class Day12Part1 implements GenericDay {

    private final ArrayList<String> lines = new ArrayList<>();

    private final int answer;



    public Day12Part1(RunType runType) {
        File inputFile = getFile(runType, 12);

        new ReadLines(inputFile, this::eatLine).readFile();

        var grid = new Grid(lines);

        answer = grid.findRouteFromStart();
    }



    private void eatLine(String line) {
        lines.add(line);
    }



    public int getAnswer() {
        return answer;
    }



    private static class Grid {

        private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

        private final Stack<v2i> currentLooks = new Stack<>();

        private final Stack<v2i> nextLooks = new Stack<>();

        private final HashSet<v2i> visitedCells = new HashSet<>();

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
            visitedCells.addAll(currentLooks);
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



        public int findRouteFromStart() {
            for (int count = 1; ; count++) {
                for (var current : currentLooks) {
                    var currentHeight = get(current);
                    if (check(moveNorth(current), currentHeight)) return count;
                    if (check(moveEast(current), currentHeight)) return count;
                    if (check(moveSouth(current), currentHeight)) return count;
                    if (check(moveWest(current), currentHeight)) return count;
                }

                currentLooks.clear();
                currentLooks.addAll(nextLooks);
                nextLooks.clear();

                if (currentLooks.isEmpty()) throw new RuntimeException("Ran out of cell to check.");
            }
        }

        private boolean check(v2i next, int currentHeight) {
            if (next != null) {
                if (visitedCells.contains(next)) return false;

                // Have we found the exit, if we have can we access it?
                if (get(next) == EXIT) return currentHeight + 1 >= ENTREE_HEIGHT;

                if (currentHeight + 1 >= get(next)) {
                    nextLooks.add(next);
                    visitedCells.add(next);
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
        private void printProgress() {
            var copy = new ArrayList<ArrayList<String>>();
            for (var row : grid) {
                var newRow = new ArrayList<String>();
                for (var v : row) {
                    newRow.add(Character.toString('a' + v));
                }
                copy.add(newRow);
            }

            for (var visited : visitedCells) {
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



    public static void main(String[] args) {
        var day = new Day12Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
