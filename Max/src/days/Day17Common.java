package days;

import utils.v2i;

import java.util.ArrayList;

public class Day17Common {

    public enum Direction { LEFT, RIGHT }



    public static class RockItr {

        private static final Rock[] ROCKS;

        static {
            var shapePieces = new v2i[][] {
                    {new v2i(0, 0), new v2i(1, 0), new v2i(2, 0), new v2i(3, 0)},
                    {new v2i(1, 0), new v2i(0, 1), new v2i(1, 1), new v2i(2, 1), new v2i(1, 2)},
                    {new v2i(0, 0), new v2i(1, 0), new v2i(2, 0), new v2i(2, 1), new v2i(2, 2)},
                    {new v2i(0, 0), new v2i(0, 1), new v2i(0, 2), new v2i(0, 3)},
                    {new v2i(0, 0), new v2i(0, 1), new v2i(1, 0), new v2i(1, 1)}
            };

            ROCKS = new Rock[] {
                new Rock(shapePieces[0]),
                new Rock(shapePieces[1]),
                new Rock(shapePieces[2]),
                new Rock(shapePieces[3]),
                new Rock(shapePieces[4])
            };
        }

        private int shapeIndex = -1;



        public Rock getNext() {
            return ROCKS[++shapeIndex % ROCKS.length];
        }



        public static Rock peekIndex(int index) {
            return ROCKS[index];
        }

    }

    public static class Rock {

        private final v2i[] pieces;

        private final int width;

        private final int height;



        public Rock(v2i[] pieces) {
            this.pieces = pieces;

            var w = 0;
            var h = 0;
            for (var p : pieces) {
                w = Integer.max(w, p.x());
                h = Integer.max(h, p.y());
            }

            width = w;
            height = h;
        }



        public v2i[] getPieces() {
            return pieces;
        }

        public int getWidth() {
            return width;
        }

        public int getHeight() {
            return height;
        }

    }

    public static class WindItr {

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



    public static v2i decrementY(v2i input) {
        return new v2i(input.x(), input.y() - 1);
    }

    public static v2i applyWind(v2i centre, Direction windDirection) {
        return switch (windDirection) {
            case LEFT -> new v2i(centre.x() - 1, centre.y());
            case RIGHT -> new v2i(centre.x() + 1, centre.y());
        };
    }

    @SuppressWarnings("unused")
    public static void printTower(ArrayList<boolean[]> tower) {
        System.out.println("|.......|");
        System.out.println("|.......|");
        System.out.println("|.......|");
        for (int i = tower.size() - 1; i > 0; i--) {
            var sb = new StringBuilder(9);
            sb.append('|');
            for (var b : tower.get(i)) {
                sb.append((b) ? '#' : '.');
            }
            sb.append('|');
            System.out.println(sb);
        }
        System.out.println("+-------+");
        System.out.println();
    }

}
