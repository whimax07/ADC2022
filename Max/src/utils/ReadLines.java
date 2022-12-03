package utils;

import java.io.*;
import java.util.function.Consumer;

/**
 * Apply the `lineConsumer` to each line of the file `inputFile` when `readFile()` is called.
 */
public class ReadLines {

    private final File inputFile;

    private final Consumer<String> lineConsumer;



    public ReadLines(File inputFile, Consumer<String> lineConsumer) {
        this.inputFile = inputFile;
        this.lineConsumer = lineConsumer;
    }



    public void readFile() {
        try (BufferedReader br = new BufferedReader(new FileReader(inputFile))) {
            var line = br.readLine();

            while (line != null) {
                lineConsumer.accept(line);
                line = br.readLine();
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
