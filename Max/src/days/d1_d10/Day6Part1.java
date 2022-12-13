package days.d1_d10;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.regex.Pattern;

public class Day6Part1 implements GenericDay {

    private final ArrayList<Integer> answer = new ArrayList<>();



    public Day6Part1(RunType runType) {
        File inputFile = getFile(runType, 6);

        new ReadLines(inputFile, this::eatLine).readFile();
    }



    private void eatLine(String line) {
        final var pattern = Pattern.compile("(\\w)(?!\\1)(\\w)(?!\\1|\\2)(\\w)(?!\\1|\\2|\\3)(\\w)");
        var matcher = pattern.matcher(line);

        if (!matcher.find()) throw new InputMismatchException("Regex has failed to find the answer.");

        answer.add(matcher.end());
    }



    public ArrayList<Integer> getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day6Part1(RunType.Q);
        assert(day.answer.size() == 1);
        System.out.println(day.answer.get(0));
    }

}
