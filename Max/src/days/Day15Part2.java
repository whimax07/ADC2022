package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.regex.Pattern;

public class Day15Part2 implements GenericDay {

    private final long answer;

    private final ArrayList<ManhattanSphere> spheres = new ArrayList<>();

    private static final int SIZE = 4_000_000;



    public Day15Part2(RunType runType, int bound) {
        File inputFile = getFile(runType, 15);

        new ReadLines(inputFile, this::eatLine).readFile();

        System.out.println(spheres);

        var gap = findGap(bound);
        System.out.println(gap);
        answer = ((long) gap.x() * SIZE) + gap.y();
    }



    private void eatLine(String line) {
        final var importantBits = Pattern.compile(".+?(-?\\d+).+?(-?\\d+).+?(-?\\d+).+?(-?\\d+).*?");
        var matcher = importantBits.matcher(line);

        if (!matcher.matches() || matcher.groupCount() != 4) throw new IllegalStateException();

        var sensor = new v2i(Integer.parseInt(matcher.group(1)), Integer.parseInt(matcher.group(2)));
        var beacon = new v2i(Integer.parseInt(matcher.group(3)), Integer.parseInt(matcher.group(4)));

        var distance = manhattanDistance(sensor, beacon);

        spheres.add(new ManhattanSphere(sensor, distance));
    }

    private v2i findGap(int bound) {
        spheres.sort(Comparator.comparingInt(o -> o.centre().x()));

        final int numSpheres = spheres.size();
        int x = 0;
        int sphereIndex = 0;
        v2i point;

        for (int y = 0; y < bound; y++) {

            while (x < bound && sphereIndex < numSpheres) {
                var sphere = spheres.get(sphereIndex);
                point = new v2i(x, y);
                var range = sphere.containsPointX(point);

                sphereIndex ++;
                if (range == null) {
                    continue;
                }

                x = range.end + 1;
            }

            if (sphereIndex == numSpheres && x < bound) {
                return new v2i(x, y);
            }

            x = 0;
            sphereIndex = 0;
        }

        throw new RuntimeException("Should have found the empty square.");
    }



    private static int manhattanDistance(v2i start, v2i end) {
        return Math.abs(start.x() - end.x()) + Math.abs(start.y() - end.y());
    }

    public long getAnswer() {
        return answer;
    }



    private record Range(int start, int end) {
        private Range(int start, int end) {
            this.start = Integer.min(start, end);
            this.end = Integer.max(start, end);
        }
    }

    private record ManhattanSphere(v2i centre, int radius) {
        public Range containsPointX(v2i point) {
            if (manhattanDistance(point, centre) > radius) return null;

            int extension =  radius - Math.abs(centre.y() - point.y());
            return new Range(point.x(), centre().x() + extension);
        }
    }



    public static void main(String[] args) {
        var day = new Day15Part2(RunType.Q, SIZE);
        System.out.println(day.answer);
    }

}
