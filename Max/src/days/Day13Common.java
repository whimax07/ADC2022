package days;

import java.util.ArrayList;

public class Day13Common {

    public static PList parse(String line) {
        var top = new PList(null);
        var current = top;
        var count = 1;
        var pos = 1;

        while (count != 0) {
            var c = line.charAt(pos);

            switch (c) {
                case '[' -> {
                    count ++;
                    var next = new PList(current);
                    current.add(next);
                    current = next;
                }
                case ']' -> {
                    count --;
                    current = current.getParent();
                }
                case '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' -> {
                    var num = eatNumber(line, pos);
                    current.add(new PInt(num));
                }
            }

            pos ++;
        }

        return top;
    }

    private static int eatNumber(String line, int startPos) {
        var endPos = startPos + 1;
        while (Character.isDigit(line.charAt(endPos))) {
            endPos ++;
        }
        return Integer.parseInt(line.substring(startPos, endPos));
    }



    public interface Packet {}

    public static class PList extends ArrayList<Packet> implements Packet {

        private final PList parent;

        public PList(PList parent) {
            this.parent = parent;
        }

        public PList getParent() {
            return parent;
        }

    }

    public record PInt(int v) implements Packet {  }

}
