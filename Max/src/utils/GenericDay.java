package utils;

import java.io.File;

public interface GenericDay {

    private File getInputFileName(int day) {
        var file = new File("max/inputs/day" + day + ".txt");

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
            case Q -> getInputFileName(day);
            case TEST -> getTestInputFileName(day);
        };
    }

}
