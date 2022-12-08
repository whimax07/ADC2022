package days;

import java.util.*;

public class Day7Common {

    public record File(String name, long size) {  }

    public static class Dir {
        private final Dir parent;

        private final String name;

        private final ArrayList<Dir> children = new ArrayList<>();

        private final ArrayList<File> files = new ArrayList<>();

        private long dirSize = -1;



        public Dir(Dir parent, String name) {
            this.parent = parent;
            this.name = name;
        }



        public void addChild(Dir dir) {
            children.add(dir);
        }

        public void addFile(File file) {
            files.add(file);
        }

        public void calculateDirSize() {
            dirSize = children.stream()
                    .map(x -> { x.calculateDirSize(); return x.dirSize; })
                    .reduce(0L, Long::sum);
            dirSize += files.stream()
                    .map(x -> x.size)
                    .reduce(0L, Long::sum);
        }

        public long getDirSize() {
            return dirSize;
        }

        public ArrayList<Dir> getChildren() {
            return children;
        }

        @SuppressWarnings("unused")
        public String getName() {
            return name;
        }

    }

    public static class BuildFileTree {

        private final Dir sentinel = new Dir(null, "SENTINEL");

        private Dir currentDir;



        public BuildFileTree() {
            currentDir = sentinel;
        }



        public void receiveLine(String line) {
            if (line.startsWith("$")) {
                parseCommand(line);
            } else {
                parseLsOutput(line);
            }
        }

        private void parseCommand(String line) {
            String command = line.substring(2);

            if (!command.startsWith("cd")) {
                // We don't need to know when `ls` is called because the format for the out of `ls` is different to a
                // command.
                return;
            }

            var name = command.substring(3);
            if (name.equals("..")) {
                currentDir = currentDir.parent;
                return;
            }

            var newDir = new Dir(currentDir, name);
            currentDir.addChild(newDir);
            currentDir = newDir;
        }

        private void parseLsOutput(String line) {
            if (line.startsWith("dir")) {
                return;
            }

            var parts = line.split(" ", 2);
            if (parts.length != 2) throw new InputMismatchException("Expected a size and a name without spaces.");

            int size = Integer.parseInt(parts[0]);
            var newFile = new File(parts[1], size);
            currentDir.addFile(newFile);
        }

        public Dir getRoot() {
            assert (sentinel.children.size() == 1);
            sentinel.children.get(0).calculateDirSize();
            return sentinel.children.get(0);
        }

    }

}
