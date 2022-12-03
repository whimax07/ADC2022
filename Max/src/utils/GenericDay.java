package utils;

import java.io.File;

public interface GenericDay {

    String getTaskName();

    default File getInputFileNamePart1() {
        var file = new File("max/inputs/" + getTaskName() + ".txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the file: \"" + getTaskName() + "\".");
        }

        return file;
    }

    default File getInputFileNamePart2() {
        var file = new File("max/inputs/" + getTaskName() + ".txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the file: \"" + getTaskName() + "\".");
        }

        return file;
    }

    default File getTestInputFileName() {
        var file = new File("max/inputs/" + getTaskName().substring(0, 4) + "_test.txt");

        if (!file.isFile()) {
            throw new RuntimeException("Can not find the test file: \"" + getTaskName() + "\" at loc: \"" + file + "\".");
        }

        return file;
    }

}
