package days.d1_d10;

import java.util.*;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Day5Common {

    public static class Towers {

        private final boolean moveOneBox;

        private String numberRow;

        private final ArrayList<ArrayList<Character>> slots = new ArrayList<>();



        public Towers(boolean moveMultipleBoxesAtOnce) {
            this.moveOneBox = !moveMultipleBoxesAtOnce;
        }



        public void addTowerRowScan(String row) {
            // This pattern matches the last line of the game board that goes 1 2 3 ...
            if (row.matches("^(\\s*\\d+\\s*)+$")) {
                numberRow = row;
                slots.forEach(Collections::reverse);
                return;
            }

            // We need a loop like this because I have no guarantee that the line is "full length" and extended with
            // spaces and I don't want to keep allocating strings.
            var slotNum = 0;
            var cRow = row.toCharArray();

            for (int lPos = 0; lPos + 2 < row.length(); lPos += 4) {
                // Check if a symbol is in this slot.
                if (cRow[lPos] == '[' && cRow[lPos + 2] == ']') {
                    // We don't know how wide the board is (number of slots) so each time we find a slot with a piece in
                    // it we need to make sure that and every slot to the left has been added to the game board.
                    while (slotNum >= slots.size()) {
                        slots.add(new ArrayList<>());
                    }

                    slots.get(slotNum).add(cRow[lPos + 1]);
                }

                slotNum++;
            }
        }

        public void makeMove(String move) {
            final var pattern = Pattern.compile("move (\\d+) from (\\d+) to (\\d+)");
            var matcher = pattern.matcher(move);

            if (matcher.groupCount() != 3) throw new IllegalStateException("Expected 3 capturing groups.");
            if (!matcher.matches()) throw  new InputMismatchException("Expected a match.");

            var amountToMove = Integer.parseInt(matcher.group(1));
            var startSlot = Integer.parseInt(matcher.group(2));
            var endSlot = Integer.parseInt(matcher.group(3));

            System.out.println(towerString());
            System.out.println(move);

            implMove(amountToMove, startSlot - 1, endSlot - 1);

            System.out.println(towerString());
        }

        private void implMove(int amountToMove, int startSlot, int endSlot) {
            var slot = slots.get(startSlot);
            var toMove = slot.subList(slot.size() - amountToMove, slot.size());
            if (moveOneBox) Collections.reverse(toMove);
            slots.get(endSlot).addAll(toMove);
            toMove.clear();
        }

        public String getTop() {
            var builder = new StringBuilder();

            for (var slot : slots) {
                if (slot.size() == 0) {
                    builder.append(" ");
                } else {
                    builder.append(slot.get(slot.size() - 1));
                }
            }

            return builder.toString();
        }

        public String towerString() {
            int maxHeight = slots.stream()
                    .map(ArrayList::size)
                    .max(Comparator.naturalOrder())
                    .orElseThrow();

            var stringRows = Stream
                    .generate(StringBuilder::new)
                    .limit(maxHeight)
                    .collect(Collectors.toCollection(ArrayList::new));

            for (int i = 0; i < maxHeight; i ++) {
                StringBuilder rowBuilder = stringRows.get(i);
                for (var slot : slots) {
                    if (i < slot.size()) {
                        var c = slot.get(i);
                        rowBuilder.append("[").append(c).append("]");
                    } else {
                        rowBuilder.append("   ");
                    }
                    rowBuilder.append(" ");
                }
            }

            var outBuilder = new StringBuilder();
            Collections.reverse(stringRows);
            stringRows.forEach(x -> outBuilder.append(x).append("\n"));
            outBuilder.append(numberRow);

            return outBuilder.toString();
        }

    }

}
