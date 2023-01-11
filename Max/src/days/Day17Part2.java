package days;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;

import static days.Day17Common.*;

public class Day17Part2 implements GenericDay {

    private final long answer;

    private WindItr windItr;

    private int windPatternLength = 0;

    private long repNumberOfRocks;

    private long repTowerHeight;

    private final ArrayList<boolean[]> tower = new ArrayList<>();

    private final ArrayList<Section> sections = new ArrayList<>();

    private Section currentSection = new Section(1);

    private int count = 0;



    public Day17Part2(RunType runType) {
        File inputFile = getFile(runType, 17);

        new ReadLines(inputFile, this::readLine).readFile();

        tower.add(new boolean[] { true, true, true, true, true, true, true });
        RockItr rockItr = new RockItr();

        var numRocks = 1_000_000_000_000L;

        var itrCrossProduct = 5 * windPatternLength;
        var foundRepAfternumRocks = 0L;

        for (long i = 0; i < numRocks/itrCrossProduct; i++) {
            for (int j = 0; j < itrCrossProduct; j++) {
                dropRock(rockItr.getNext());
            }

            sections.add(currentSection);
            if (findReps()) {
                foundRepAfternumRocks = i * itrCrossProduct;
                break;
            }
            currentSection = new Section(tower.size() - 1);
        }

        var numReps = (numRocks - foundRepAfternumRocks) / repNumberOfRocks;
        var remainder = (numRocks - foundRepAfternumRocks) % repNumberOfRocks;

        for (int i = 0; i < remainder; i++) {
            dropRock(rockItr.getNext());
        }

        answer = tower.size() + numReps * repTowerHeight;
    }

    private boolean findReps() {
        for (int i = 1; i < sections.size() / 2; i++) {
            var start1 = sections.size() - i;
            var list1 = sections.subList(start1, sections.size());

            var start2 = start1 - i;
            var list2 = sections.subList(start2, start1);

            if (list1.equals(list2)) {
                for (var section : list1) {
                    repTowerHeight += section.getHeight();
                }
                repNumberOfRocks = list1.size() * 5L * windPatternLength;
                return true;
            }
        }

        System.out.println(++count);

        return false;
    }

    private void readLine(String line) {
        windItr = new WindItr(line);
        windPatternLength = line.length();
    }

    private void dropRock(Rock rock) {
        var centre = new v2i(2, tower.size() + 3);

        // When centre.y is zero the rock is resting on the ground.
        while (centre.y() > 0) {
            var wind = windItr.next();
            if (!collidesHorizontal(rock, centre, wind)) {
                centre = applyWind(centre, wind);
            }

            if (collidesVertical(rock, centre)) {
                addRockToWall(rock, centre);
                return;
            }
            centre = decrementY(centre);
        }

        throw new RuntimeException("The rock should have hit the floor but didn't.");
    }

    private boolean collidesHorizontal(Rock rock, v2i centre, Direction wind) {
        if (wind == Direction.LEFT && centre.x() == 0) return true;

        if (wind == Direction.RIGHT && centre.x() + rock.getWidth() == 6) return true;

        var maxHeight = tower.size() - 1;
        var windOffset = (wind == Direction.LEFT) ? -1 : 1;

        for (var piece : rock.getPieces()) {
            int height = centre.y() + piece.y();
            if (height > maxHeight) continue;

            int x = centre.x() + piece.x() + windOffset;
            if (tower.get(height)[x]) return true;
        }

        return false;
    }

    private boolean collidesVertical(Rock rock, v2i centre) {
        if (centre.y() > tower.size()) return false;

        var maxHeight = tower.size();

        // centre.y should be greater than 0 as the ground is at 0.
        assert(centre.y() > 0);

        for (var rockPiece : rock.getPieces()) {
            int height = centre.y() + rockPiece.y();
            if (height > maxHeight) continue;

            if (tower.get(height - 1)[centre.x() + rockPiece.x()]) return true;
        }

        return false;
    }

    private void addRockToWall(Rock rock, v2i centre) {
        for (var piece : rock.getPieces()) {
            int height = centre.y() + piece.y();

            while (tower.size() <= height) {
                tower.add(new boolean[7]);
            }

            tower.get(height)[centre.x() + piece.x()] = true;
            currentSection.mergeRow(height, tower.get(height));
        }
    }



    public long getAnswer() {
        return answer;
    }


    public static class Section {

        private final ArrayList<boolean[]> tower = new ArrayList<>();

        private final int startHeight;

        private int currentBaseHeight;



        public Section(int startHeight) {
            this.startHeight = startHeight;
            currentBaseHeight = startHeight;
        }



        public int getHeight() {
            return tower.size() - (startHeight - currentBaseHeight);
        }

        public void mergeRow(int height, boolean[] toAdd) {
            var index = height - currentBaseHeight;

            if (index >= 0) {
                while (index >= tower.size()) {
                    tower.add(new boolean[7]);
                }

                add(toAdd, index);
            } else {
                var head = new ArrayList<boolean []>();
                for (int i = 0; i < currentBaseHeight - height; i++) {
                    head.add(new boolean[7]);
                }
                tower.addAll(0, head);
                currentBaseHeight = height;

                add(toAdd, 0);
            }
        }

        private void add(boolean[] toAdd, int index) {
            var row = tower.get(index);
            for (int i = 0; i < 7; i++) {
                row[i] = row[i] || toAdd[i];
            }
        }



        public boolean equals(Section obj) {
            if (getHeight() != obj.getHeight()) return false;

            if (tower.size() != obj.tower.size()) return false;

            for (int i = 0; i < tower.size(); i++) {
                if (!Arrays.equals(tower.get(i), obj.tower.get(i))) return false;
            }

            return true;
        }

    }



    public static void main(String[] args) {
        var day = new Day17Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
