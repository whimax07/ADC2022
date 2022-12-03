package utils;

import java.io.File;

public interface GenericDay {

    private File getInputFileNamePart1(int day) {
        var file = new File("max/inputs/day" + day + "_1.txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the file: \"" + file + "\".");
        }

        return file;
    }

    private File getInputFileNamePart2(int day) {
        var file = new File("max/inputs/day" + day + "_2.txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the file: \"" + file + "\".");
        }

        return file;
    }

    private File getTestInputFileName(int day) {
        var file = new File("max/inputs/day" + day + "_test.txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the test file: \"" + file + "\".");
        }

        return file;
    }

    default File getFile(RunType runType, int day) {
        return switch (runType) {
            case PART1 -> getInputFileNamePart1(day);
            case PART2 -> getInputFileNamePart2(day);
            case TEST -> getTestInputFileName(day);
        };
    }

}
