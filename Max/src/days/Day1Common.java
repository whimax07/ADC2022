package days;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Day1Common {

    public static ArrayList<Integer> readFile(File inputFile) {
        var values = new ArrayList<Integer>();

        try(BufferedReader br = new BufferedReader(new FileReader(inputFile))) {
            var line = br.readLine();
            int sum = 0;

            while (line != null) {
                if (line.isBlank()) {
                    values.add(sum);
                    sum = 0;
                } else {
                    sum += Integer.parseInt(line);
                }

                line = br.readLine();
            }

            if (sum != 0) {
                values.add(sum);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return values;
    }

}
