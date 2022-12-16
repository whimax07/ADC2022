package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.regex.Pattern;

public class Day15Part1 implements GenericDay {

    private long answer = 0;

    private final ArrayList<Range> ranges = new ArrayList<>();

    private final HashSet<v2i> beaconsOnY = new HashSet<>();

    private final int interestY;



    public Day15Part1(RunType runType, int interestY) {
        this.interestY = interestY;

        File inputFile = getFile(runType, 15);

        new ReadLines(inputFile, this::eatLine).readFile();

        ranges.sort(Comparator.comparingInt(r -> r.start));
        for (int i = ranges.size() - 2; i >= 0; i--) {
            var r1 = ranges.get(i);
            var r2 = ranges.get(i + 1);

            if (r1.overlap(r2)) {
                var newRange = r1.merdgeRange(r2);
                ranges.remove(r2);
                ranges.remove(r1);
                ranges.add(newRange);
            }
        }

        for (var range : ranges) {
            answer += 1 + range.end() - range.start();
        }
        answer = answer - beaconsOnY.size();
    }



    private void eatLine(String line) {
        final var importantBits = Pattern.compile(".+?(-?\\d+).+?(-?\\d+).+?(-?\\d+).+?(-?\\d+).*?");
        var matcher = importantBits.matcher(line);

        if (!matcher.matches() || matcher.groupCount() != 4) throw new IllegalStateException();

        var sensor = new v2i(Integer.parseInt(matcher.group(1)), Integer.parseInt(matcher.group(2)));
        var beacon = new v2i(Integer.parseInt(matcher.group(3)), Integer.parseInt(matcher.group(4)));

        if (beacon.y() == interestY) beaconsOnY.add(beacon);

        var distance = manhattanDistance(sensor, beacon);

        var halfWidth = distance - Math.abs(sensor.y() - interestY);
        if (halfWidth < 0) return;

        ranges.add(new Range(sensor.x() - halfWidth, sensor.x() + halfWidth));
    }

    private int manhattanDistance(v2i start, v2i end) {
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

        public boolean overlap(Range other) {
            return start <= other.end || other.start <= end;
        }

        public Range merdgeRange(Range other) {
            return new Range(Integer.min(start, other.start), Integer.max(end, other.end));
        }
    }



    public static void main(String[] args) {
        var day = new Day15Part1(RunType.Q, 2_000_000);
        System.out.println(day.answer);
    }

}
