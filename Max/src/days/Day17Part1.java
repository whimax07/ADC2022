package days;

import days.Day17Common.Direction;
import days.Day17Common.Rock;
import days.Day17Common.RockItr;
import days.Day17Common.WindItr;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;

import static days.Day17Common.applyWind;
import static days.Day17Common.decrementY;

public class Day17Part1 implements GenericDay {

    private final int answer;

    private WindItr windItr;

    private final ArrayList<boolean[]> tower = new ArrayList<>();



    public Day17Part1(RunType runType) {
        File inputFile = getFile(runType, 17);

        new ReadLines(inputFile, this::readLine).readFile();

        tower.add(new boolean[] { true, true, true, true, true, true, true });
        RockItr rockItr = new RockItr();

        for (int i = 0; i < 2022; i++) {
            dropRock(rockItr.getNext());
        }

        answer = tower.size() - 1;
    }

    private void readLine(String line) {
        windItr = new WindItr(line);
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
        }
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day17Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
