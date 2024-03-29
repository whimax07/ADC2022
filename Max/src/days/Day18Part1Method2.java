package days;

import utils.Counter;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.HashSet;

/**
 * There are two main chooses I can think of for the needed data structure an Array of bools and a HashMap (HashSet and
 * Counter here). You can also take to approaches to the algorithm either keep track of the cubes and see if any faces
 * of the current cube are occupied or keep track of the faces of each square you encounter.
 * <br>
 * I believe that the Array of bools and tracking what cubes are present is the best. This is implemented in
 * Day18Part1Method1.
 */
public class Day18Part1Method2 implements GenericDay {

    private final HashSet<v3s> squareSet = new HashSet<>();

    private int joinedFaces = 0;

    private final Counter<v3s> openFaces = new Counter<>();

    private int closedFaceCount = 0;

    private final int answer;



    public Day18Part1Method2(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();

        answer = (squareSet.size() * 6) - (joinedFaces * 2);
        assert(answer == (openFaces.countTotal() - closedFaceCount));
    }

    private void readLine(String line) {
        var cords = line.split(",");

        var x = Short.parseShort(cords[0]);
        var y = Short.parseShort(cords[1]);
        var z = Short.parseShort(cords[2]);

        ideaCheckForExistingCells(x, y, z);
        ideaCheckForFaces(x, y, z);
    }

    private void ideaCheckForExistingCells(short x, short y, short z) {
        squareSet.add(new v3s(x, y, z));

        if (squareSet.contains(new v3s((short) (x + 1), y, z))) joinedFaces ++;
        if (squareSet.contains(new v3s((short) (x - 1), y, z))) joinedFaces ++;
        if (squareSet.contains(new v3s(x, (short) (y + 1), z))) joinedFaces ++;
        if (squareSet.contains(new v3s(x, (short) (y - 1), z))) joinedFaces ++;
        if (squareSet.contains(new v3s(x, y, (short) (z + 1)))) joinedFaces ++;
        if (squareSet.contains(new v3s(x, y, (short) (z - 1)))) joinedFaces ++;
    }

    private void ideaCheckForFaces(short x, short y, short z) {
        var count = openFaces.count(new v3s(x, y, z));
        if (count > 0) {
            closedFaceCount += count * 2;
        }

        openFaces.add(new v3s((short) (x + 1), y, z));
        openFaces.add(new v3s((short) (x - 1), y, z));
        openFaces.add(new v3s(x, (short) (y + 1), z));
        openFaces.add(new v3s(x, (short) (y - 1), z));
        openFaces.add(new v3s(x, y, (short) (z + 1)));
        openFaces.add(new v3s(x, y, (short) (z - 1)));
    }



    public int getAnswer() {
        return answer;
    }



    private record v3s(short x, short y, short z) {  }



    public static void main(String[] args) {
        var day = new Day18Part1Method2(RunType.Q);
        System.out.println(day.answer);
    }

}
