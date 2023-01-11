package days;

import utils.v2i;

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

    }

    public static class Rock {

        private final v2i[] pieces;

        private final int width;



        public Rock(v2i[] pieces) {
            this.pieces = pieces;

            var w = 0;
            for (var p : pieces) {
                w = Integer.max(w, p.x());
            }

            width = w;
        }



        public v2i[] getPieces() {
            return pieces;
        }

        public int getWidth() {
            return width;
        }

    }

}
