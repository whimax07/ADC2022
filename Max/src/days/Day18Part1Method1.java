package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;

/**
 * There are two main chooses I can think of for the needed data structure an Array of bools and a HashMap (HashSet and
 * Counter here). You can also take to approaches to the algorithm either keep track of the cubes and see if any faces
 * of the current cube are occupied or keep track of the faces of each square you encounter.
 * <br>
 * I believe that the Array of bools and tracking what cubes are present is the best. This is implemented in
 * Day18Part1Method1.
 */
public class Day18Part1Method1 implements GenericDay {

    private final boolean[][][] cubeArray;

    private int maxX = 0;

    private int maxY = 0;

    private int maxZ = 0;

    private final ArrayList<v3c> inputs = new ArrayList<>();

    private int area;

    private final int answer;



    public Day18Part1Method1(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();

        area = inputs.size() * 6;
        cubeArray = new boolean[maxX + 3][maxY + 3][maxZ + 3];

        for (var cube : inputs) {
            updateArea(cube);
        }

        answer = area;
    }

    private void readLine(String line) {
        var cords = line.split(",");

        char x = (char) Short.parseShort(cords[0]);
        char y = (char) Short.parseShort(cords[1]);
        char z = (char) Short.parseShort(cords[2]);

        maxX = Math.max(maxX, x);
        maxY = Math.max(maxY, y);
        maxZ = Math.max(maxZ, z);

        inputs.add(new v3c(x, y, z));
    }

    private void updateArea(v3c cube) {
        char x = (char) (cube.x + 1);
        char y = (char) (cube.y + 1);
        char z = (char) (cube.z + 1);

        if (cubeArray[x + 1][y][z]) area -= 2;
        if (cubeArray[x - 1][y][z]) area -= 2;
        if (cubeArray[x][y + 1][z]) area -= 2;
        if (cubeArray[x][y - 1][z]) area -= 2;
        if (cubeArray[x][y][z + 1]) area -= 2;
        if (cubeArray[x][y][z - 1]) area -= 2;

        cubeArray[x][y][z] = true;
    }



    public int getAnswer() {
        return answer;
    }



    private record v3c(char x, char y, char z) {  }



    public static void main(String[] args) {
        var day = new Day18Part1Method1(RunType.Q);
        System.out.println(day.answer);
    }

}
