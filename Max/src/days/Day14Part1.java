package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import static utils.v2i.add;
import static utils.v2i.subtract;

public class Day14Part1 implements GenericDay {

    private int answer;

    private final HashMap<v2i, Material> map = new HashMap<>();

    private int highest = 0;



    public Day14Part1(RunType runType) {
        File inputFile = getFile(runType, 14);

        new ReadLines(inputFile, this::eatLine).readFile();

        printTerrain();
        runSim();
        printTerrain();
    }



    private void eatLine(String line) {
        var cords = line.split(" -> ");
        var points = new ArrayList<v2i>();

        for (var cord : cords) {
            var xy = cord.split(",");
            var point = new v2i(Integer.parseInt(xy[0]), Integer.parseInt(xy[1]));
            points.add(point);
            highest = Integer.max(highest, point.y());
        }

        var start = points.get(0);
        map.put(start, Material.ROCK);

        for (var end : points.subList(1, points.size())) {
            var change = subtract(end, start);
            var unit = unitChange(change);

            do {
                start = add(start, unit);
                map.put(start, Material.ROCK);
            } while (!start.equals(end));

        }
    }

    private v2i unitChange(v2i fullChange) {
        if ((fullChange.x() != 0) && (fullChange.y() != 0)) {
            throw new IllegalStateException();
        }

        return new v2i(Integer.signum(fullChange.x()), Integer.signum(fullChange.y()));
    }

    private void runSim() {
        while (true) {
            if (!resolveSand()) break;
        }
    }

    private boolean resolveSand() {
        var x = 500;
        var y = 0;

        v2i next;

        while (y <= highest + 1) {
            next = new v2i(x, y + 1);
            if (!map.containsKey(next)) {
                y ++;
                continue;
            }

            next = new v2i(x - 1, y + 1);
            if (!map.containsKey(next)) {
                y ++;
                x --;
                continue;
            }

            next = new v2i(x + 1, y + 1);
            if (!map.containsKey(next)) {
                y ++;
                x ++;
                continue;
            }

            map.put(new v2i(x, y), Material.SAND);
            answer ++;
            return true;
        }

        return false;
    }

    private void printTerrain() {
        ArrayList<ArrayList<String>> grid = new ArrayList<>();

        var minX = 500;
        var maxX = 500;

        for (var key : map.keySet()) {
            minX = Integer.min(minX, key.x());
            maxX = Integer.max(maxX, key.x());
        }

        int rowWidth = (maxX - minX) + 1 + 2;

        for (int y = 0; y < highest + 1; y++) {
            var row = new ArrayList<String>();
            for (int x = 0; x < rowWidth; x++) {
                row.add(".");
            }
            grid.add(row);
        }

        for (var key : map.keySet()) {
            var x = key.x() - (minX - 1);
            grid.get(key.y()).set(x, (map.get(key) == Material.ROCK) ? "#" : "o");
        }

        for (var row : grid) {
            System.out.println(row);
        }
        System.out.println();
    }



    public int getAnswer() {
        return answer;
    }



    private enum Material { ROCK, SAND }



    public static void main(String[] args) {
        var day = new Day14Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
