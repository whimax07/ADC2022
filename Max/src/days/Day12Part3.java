package days;

import utils.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Stack;

public class Day12Part3 implements GenericDay {

    private final ArrayList<String> lines = new ArrayList<>();

    private final int answer;



    public Day12Part3(RunType runType) {
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



    private static class PathTreeNode extends ManyLeafTree<v2i> {

        public PathTreeNode(PathTreeNode parent, v2i loc) {
            super(parent, loc);
        }

        public void proneNode() {
            var parent = getParent();
            if (parent instanceof PathTreeNode parentTree) {
                parentTree.getChildren().remove(this);
                if (parentTree.getChildren().isEmpty()) {
                    parentTree.proneNode();
                }
            } else {
                if (parent == null) {
                    return;
                }
                throw new RuntimeException("I wasn't expecting this is to fail the up cast.");
            }
        }

        public ArrayList<v2i> backTrackPath(v2i end) {
            var path = new ArrayList<v2i>();

            if (end != null) path.add(end);

            ManyLeafTree<v2i> current = this;
            while (current != null) {
                path.add(current.getData());
                current = current.getParent();
            }

            Collections.reverse(path);
            return path;
        }

    }

    /**
     * To make this a super set of part 1 make {@link Grid#findRoute()} take a predicate function as an argument that
     * determines if a point on the grid is another start point. For part one pass a function that always returns false.
     * For part 2 pass in a function that checks if the height is zero.
     */
    private static class Grid {

        private final ArrayList<ArrayList<Integer>> grid = new ArrayList<>();

        private final Stack<PathTreeNode> currentLooks = new Stack<>();

        private final Stack<PathTreeNode> nextLooks = new Stack<>();

        private final HashMap<v2i, Integer> visitedCells = new HashMap<>();

        private ArrayList<v2i> shortestPath = new ArrayList<>();

        private final int HEIGHT;

        private final int WIDTH;

        private v2i EXIT_POS;

        private static final int EXIT_HEIGHT = -1;

        private static final int ENTREE_HEIGHT = 'z' - 'a';



        public Grid(ArrayList<String> rows) {
            for (var row : rows) {
                parseRow(row);
            }

            WIDTH = grid.get(0).size();
            HEIGHT = grid.size();

            visitedCells.put(currentLooks.get(0).getData(), 1);
        }

        private void parseRow(String row) {
            var rowList = new ArrayList<Integer>();
            var rowChars = row.toCharArray();

            for (int i = 0; i < row.length(); i++) {
                var c = rowChars[i];
                if (c == 'S') {
                    var start = new PathTreeNode(null, new v2i(i, grid.size()));
                    currentLooks.add(start);
                    rowList.add(0);
                } else if (c == 'E') {
                    EXIT_POS = new v2i(i, grid.size());
                    rowList.add(EXIT_HEIGHT);
                } else {
                    rowList.add(c - 'a');
                }
            }

            grid.add(rowList);
        }



        public int findRoute() {
            shortestPath = checkRoute();
            printRoot();

            var startPoints = new ArrayList<PathTreeNode>();

            // Look for all the zero height cells and add them to the starting point list.
            for (int y = 0; y < HEIGHT; y++) {
                var row = grid.get(y);
                for (int x = 0; x < WIDTH; x++) {
                    if (row.get(x) == 0) {
                        var startPoint = new PathTreeNode(null, new v2i(x, y));
                        startPoints.add(startPoint);
                    }
                }
            }

            // Check each of the starting points to see if it has the shortest path to the exit.
            for (var startPoint : startPoints) {
                currentLooks.clear();
                nextLooks.clear();

                currentLooks.add(startPoint);
                var path = checkRoute();

                if (path != null && path.size() < shortestPath.size()) {
                    shortestPath = path;
                    printRoot();
                }
            }

            assert shortestPath != null;
            // The other answers don't include the exit in the same the shortestPath does so subtract it from the array
            // size.
            return shortestPath.size() - 1;
        }

        private ArrayList<v2i> checkRoute() {
            var maxCount = (shortestPath.isEmpty()) ? Integer.MAX_VALUE : shortestPath.size();
            for (int count = 1; count < maxCount; count++) {

                for (var current : currentLooks) {
                    var startingNextLooksCount = nextLooks.size();
                    var directions = new v2i[] {
                            moveNorth(current.getData()),
                            moveEast(current.getData()),
                            moveSouth(current.getData()),
                            moveWest(current.getData())
                    };

                    for (var d : directions) {
                        if (check(d, current, count)) {
                            // The exit has been found.
                            return current.backTrackPath(EXIT_POS);
                        }
                    }

                    // If the counts are different then the current cell is adjacent to a cell that made progress.
                    if (startingNextLooksCount == nextLooks.size()) {
                        current.proneNode();
                    }
                }

                currentLooks.clear();
                currentLooks.addAll(nextLooks);
                nextLooks.clear();

                // Haven't found the exit and there aren't any more cells to check.
                if (currentLooks.isEmpty()) break;
            }

            return null;
        }

        private boolean check(v2i next, PathTreeNode currentNode, int cycle) {
            var height = get(currentNode.getData());

            if (next == null) return false;

            // If we have visited next before, and it has in fewer steps it isn't a candidate to be on the shortest
            // path.
            if (visitedCells.containsKey(next) && visitedCells.get(next) <= cycle) return false;

            // Have we found the exit, if we have can we access it?
            if (get(next) == EXIT_HEIGHT) return height + 1 >= ENTREE_HEIGHT;

            // If at this point we can get to the cell `next` then we want to check it in case it is on the fastest path
            // in the future. We add it to visited cells now because we don't need to have more than one route use it.
            if (height + 1 >= get(next)) {
                var toLook = new PathTreeNode(currentNode, next);
                nextLooks.add(toLook);
                visitedCells.put(next, cycle);
            }

            // We couldn't reach the exit this time.
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

            for (var visited : visitedCells.keySet()) {
                copy.get(visited.y()).set(visited.x(), "*");
            }

            for (var toLookAt : currentLooks) {
                var loc = toLookAt.getData();
                var newChar = Character.toString('A' + get(loc));
                copy.get(loc.y()).set(loc.x(), newChar);
            }

            for (var row : copy) System.out.println(row);
            System.out.println();
        }

        private void printRoot() {
            if (shortestPath.isEmpty()) return;

            var copy = new ArrayList<ArrayList<String>>(HEIGHT);
            for (var ignored : grid) {
                var stringRow = new ArrayList<String>();
                for (int i = 0; i < WIDTH; i++) {
                    stringRow.add("*");
                }
                copy.add(stringRow);
            }

            for (var loc : shortestPath) {
                var height = Character.toString('a' + get(loc));
                copy.get(loc.y()).set(loc.x(), height);
            }

            for (var row : copy) {
                System.out.println(row);
            }
            System.out.println();
        }

    }



    public static void main(String[] args) {
        var day = new Day12Part3(RunType.Q);
        System.out.println(day.answer);
    }

}
