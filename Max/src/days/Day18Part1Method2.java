package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.HashSet;

public class Day18Part1Method2 implements GenericDay {

    private final HashSet<v3s> conflictSet = new HashSet<>();

    private int count = 0;

    private int joinedFaces = 0;

    private final int answer;



    public Day18Part1Method2(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();

        answer = (count * 6) - (joinedFaces * 2);
    }

    private void readLine(String line) {
        count ++;

        var cords = line.split(",");

        var x = Short.parseShort(cords[0]);
        var y = Short.parseShort(cords[1]);
        var z = Short.parseShort(cords[2]);

        conflictSet.add(new v3s(x, y, z));

        if (conflictSet.contains(new v3s((short) (x - 1), y, z))) joinedFaces ++;
        if (conflictSet.contains(new v3s((short) (x + 1), y, z))) joinedFaces ++;
        if (conflictSet.contains(new v3s(x, (short) (y - 1), z))) joinedFaces ++;
        if (conflictSet.contains(new v3s(x, (short) (y + 1), z))) joinedFaces ++;
        if (conflictSet.contains(new v3s(x, y, (short) (z - 1)))) joinedFaces ++;
        if (conflictSet.contains(new v3s(x, y, (short) (z + 1)))) joinedFaces ++;
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
