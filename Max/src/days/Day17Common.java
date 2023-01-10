package days;

import utils.v2i;

public class Day17Common {

    public static class Shapes {

        private static final v2i[][] SHAPE_OFFSETS;

        static {
            SHAPE_OFFSETS = new v2i[][] {
                    {new v2i(0, 0), new v2i(1, 0), new v2i(2, 0), new v2i(3, 0)},
                    {new v2i(1, 0), new v2i(0, 1), new v2i(1, 1), new v2i(2, 1), new v2i(1, 2)},
                    {new v2i(0, 0), new v2i(1, 0), new v2i(2, 0), new v2i(2, 1), new v2i(2, 2)},
                    {new v2i(0, 0), new v2i(0, 1), new v2i(0, 2), new v2i(0, 3)},
                    {new v2i(0, 0), new v2i(0, 1), new v2i(1, 0), new v2i(1, 1)}
            };
        }

        private int shapeIndex = -1;



        public v2i[] getNextShape() {
            return SHAPE_OFFSETS[++shapeIndex % SHAPE_OFFSETS.length];
        }

    }

}
