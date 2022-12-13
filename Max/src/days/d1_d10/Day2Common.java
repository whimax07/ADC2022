package days.d1_d10;

import java.io.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.function.Function;

public class Day2Common {

    public static final Shape ROCK = new Shape(Shape.ROCK);

    public static final Shape PAPER = new Shape(Shape.PAPER);

    public static final Shape SCISSORS = new Shape(Shape.SCISSORS);



    public static ArrayList<Round> readFile(File inputFile, Function<String, Round> parseRound) {
        var rounds = new ArrayList<Round>();

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile))) {
            var line = br.readLine();

            while (line != null) {
                if (line.isBlank()) {
                    continue;
                }

                var round = parseRound.apply(line);
                rounds.add(round);
                line = br.readLine();
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return rounds;
    }



    public record Round(Shape me, Shape opponent) {

        public int getScore() {
            return me.val + (me.winAgeist(opponent) + 1) * 3;
        }

    }

    public static final class Shape {

        private static final int ROCK = 1;

        private static final int PAPER = 2;

        private static final int SCISSORS = 3;



        private final int val;

        private Shape(int val) {
            this.val = val;
        }



        public int winAgeist(Shape opponent) {
            if (opponent.val == ROCK) {
                return switch (val) {
                    case ROCK -> 0;
                    case PAPER -> 1;
                    case SCISSORS -> -1;
                    default -> throw new RuntimeException("Unimplemented option.");
                };
            }

            if (opponent.val == SCISSORS) {
                return switch (val) {
                    case ROCK -> 1;
                    case PAPER -> -1;
                    case SCISSORS -> 0;
                    default -> throw new RuntimeException("Unimplemented option.");
                };
            }

            if (opponent.val == PAPER) {
                return switch (val) {
                    case ROCK -> -1;
                    case PAPER -> 0;
                    case SCISSORS -> 1;
                    default -> throw new RuntimeException("Unimplemented option.");
                };
            }

            throw new RuntimeException("Unimplemented option.");
        }

        public int val() {
            return val;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Shape shape = (Shape) o;
            return val == shape.val;
        }

        @Override
        public int hashCode() {
            return Objects.hash(val);
        }

        @Override
        public String toString() {
            return "Shape{" +
                    switch (val) {
                        case 1 -> "ROCK";
                        case 2 -> "PAPER";
                        case 3 -> "SCISSORS";
                        default -> throw new IllegalStateException("Unexpected value: " + val);
                    } +
                    '}';
        }
    }

}
