package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.HashSet;
import java.util.Optional;
import java.util.Stack;
import java.util.function.Predicate;

public class Day18Part2 implements GenericDay {

    private final HashSet<v3i> cubes = new HashSet<>();

    private final HashSet<v3i> visitedCubes = new HashSet<>();

    private final Bounds bounds = new Bounds();

    private final Predicate<v3i> boundsChecker;

    private int answer = 0;



    public Day18Part2(RunType runType) {
        File inputFile = getFile(runType, 18);

        new ReadLines(inputFile, this::readLine).readFile();
        boundsChecker = bounds.createChecker();

        // Fill the container with "gas" (a breath first search) and then count the contacted surfaces.
        gasTheBoundingBox();
    }

    private void readLine(String line) {
        var cords = line.split(",");

        short x = Short.parseShort(cords[0]);
        short y = Short.parseShort(cords[1]);
        short z = Short.parseShort(cords[2]);

        v3i cube = new v3i(x, y, z);
        cubes.add(cube);
        bounds.ingestContainedCube(cube);
    }

    private void gasTheBoundingBox() {
        var nextTickGas = new Stack<v3i>();
        var currentGas = new Stack<v3i>();

        nextTickGas.add(bounds.getMinCornerCube());

        while (!nextTickGas.empty()) {
            currentGas  = nextTickGas;
            nextTickGas = expandGas(currentGas);
        }
    }

    private Stack<v3i> expandGas(Stack<v3i> currentGas) {
        var nextGas = new Stack<v3i>();

        for (var gas : currentGas) {
            isOpenAir(new v3i(gas.x() + 1, gas.y(), gas.z())).ifPresent(nextGas::add);
            isOpenAir(new v3i(gas.x() - 1, gas.y(), gas.z())).ifPresent(nextGas::add);

            isOpenAir(new v3i(gas.x(), gas.y() + 1, gas.z())).ifPresent(nextGas::add);
            isOpenAir(new v3i(gas.x(), gas.y() - 1, gas.z())).ifPresent(nextGas::add);

            isOpenAir(new v3i(gas.x(), gas.y(), gas.z() + 1)).ifPresent(nextGas::add);
            isOpenAir(new v3i(gas.x(), gas.y(), gas.z() - 1)).ifPresent(nextGas::add);
        }

        return nextGas;
    }

    private Optional<v3i> isOpenAir(v3i toCheck) {
        if (!boundsChecker.test(toCheck)) {
            return Optional.empty();
        }

        if (cubes.contains(toCheck)) {
            answer ++;
            return Optional.empty();
        }

        if (visitedCubes.contains(toCheck)) {
            return Optional.empty();
        }

        visitedCubes.add(toCheck);
        return Optional.of(toCheck);
    }



    public int getAnswer() {
        return answer;
    }

    
    
    private record v3i(int x, int y, int z) {  }
    
    private static class Bounds {

        private int maxX = 0;
        
        private int minX = Integer.MAX_VALUE;

        private int maxY = 0;

        private int minY = Integer.MAX_VALUE;
        
        private int maxZ = 0;

        private int minZ = Integer.MAX_VALUE;
        
        
        
        public void ingestContainedCube(v3i cube) {
            maxX = Integer.max(cube.x, maxX);
            minX = Integer.min(cube.x, minX);
            
            maxY = Integer.max(cube.y, maxY);
            minY = Integer.min(cube.y, minY);
            
            maxZ = Integer.max(cube.z, maxZ);
            minZ = Integer.min(cube.z, minZ);
        }
        
        public Predicate<v3i> createChecker() {
            // This function can have a lot changed to make it robust, but I don't need that. I just want a way of not
            // having a "have you expanded your bounds" at the start of the #isContained method. This may not end up
            // being any faster than having that check because of indirection but i quite like the API any way.
            finalizze();
            return this::isContained;
        }

        private void finalizze() {
            maxX ++;
            minX --;
            maxY ++;
            minY --;
            maxZ ++;
            minZ --;
        }

        private boolean isContained(v3i cube) {
            return cube.x <= maxX && cube.x >= minX
                    && cube.y <= maxY && cube.y >= minY
                    && cube.z <= maxZ && cube.z >= minZ;
        }

        public v3i getMinCornerCube() {
            return new v3i(
                    (short) minX,
                    (short) minY,
                    (short) minZ
            );
        }

    }
    


    public static void main(String[] args) {
        var day = new Day18Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
