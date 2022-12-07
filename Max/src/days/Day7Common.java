package days;

import java.util.ArrayList;

public class Day7Common {





    public static class FileTree {
        private final Dir root = new Dir(null, "/");



        public Dir getRoot() {
            return root;
        }



        public record File(String name, long size) {  }

        public static class Dir {
            private final Dir parent;

            private final String name;

            private final ArrayList<Dir> children = new ArrayList<>();

            private final ArrayList<File> files = new ArrayList<>();

            private long dirSize = 0;



            public Dir(Dir parent, String name) {
                this.parent = parent;
                this.name = name;
            }



            // Calculate size.



            // Getters and setters.

        }

    }


}
