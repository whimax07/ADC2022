package days;

import days.Day17Common.Direction;
import days.Day17Common.Rock;
import days.Day17Common.RockItr;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;
import utils.v2i;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Day17Part1 implements GenericDay {

    private int answer = 0;

    private WindItr windItr;

    private final List<boolean[]> tower = new ArrayList<>();



    public Day17Part1(RunType runType) {
        File inputFile = getFile(runType, 17);

        new ReadLines(inputFile, this::readLine).readFile();

        tower.add(new boolean[] { true, true, true, true, true, true, true });
        RockItr rockItr = new RockItr();

        for (int i = 0; i < 2022; i++) {
            dropRock(rockItr.getNext());
        }
    }

    private void readLine(String line) {
        windItr = new WindItr(line);
    }

    private void dropRock(Rock rock) {
        var centre = new v2i(2, tower.size() + 4);

        for (int height = tower.size() + 3; height > 0; height--) {
            var stops = checkCollisionVertical(rock, centre);
            if (stops) {
                addRockToWall(rock, centre);
                return;
            }
            centre = decrementY(centre);

            var wind = windItr.next();
            var blocked = checkCollisionHorizontal(rock, centre, wind);
            if (!blocked) {
                centre = applyWind(centre, rock.getWidth(), wind);
            }
        }

        throw new RuntimeException("The rock should have hit the floor but didn't.");
    }

    private boolean checkCollisionVertical(Rock rock, v2i centre) {
        return false;
    }

    private void addRockToWall(Rock rock, v2i postion) {

    }

    private boolean checkCollisionHorizontal(Rock rock, v2i centre, Direction wind) {
        return false;
    }



    private static v2i decrementY(v2i input) {
        return new v2i(input.x() - 1, input.y());
    }

    public v2i applyWind(v2i centre, int width, Direction windDirection) {
        return switch (windDirection) {
            case LEFT -> new v2i(centre.x() - 1, centre.y());
            case RIGHT -> new v2i(centre.x() + 1, centre.y());
        };
    }



    public int getAnswer() {
        return answer;
    }





    private static class WindItr {

        private final ArrayList<Direction> winds = new ArrayList<>();

        private int turnNumber = -1;



        public WindItr(String line) {
            for (var c : line.toCharArray()) {
                switch (c) {
                    case '<' -> winds.add(Direction.LEFT);
                    case '>' -> winds.add(Direction.RIGHT);
                }
            }
        }



        public Direction next() {
            turnNumber = (turnNumber + 1) % winds.size();
            return winds.get(turnNumber);
        }

    }





    public static void main(String[] args) {
        var day = new Day17Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
