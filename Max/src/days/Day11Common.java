package days;

import java.util.ArrayList;
import java.util.InputMismatchException;

public class Day11Common {

    public static class Monkey {

        private final ArrayList<Long> items = new ArrayList<>();

        private final Operation operation;

        private final Test test;

        private int inspectCount = 0;



        public Monkey(ArrayList<String> lines) {
            // NOTE(Max): We don't need to know the moneys number here, so we skip the first line.

            var startingItems = lines.get(1).substring("  Starting items: ".length());
            for (var item : startingItems.split(", ")) {
                items.add(Long.parseLong(item));
            }

            var opString = lines.get(2).substring("  Operation: new = old ".length());
            var opStringParts = opString.split(" ");
            operation = new Operation(opStringParts[0], opStringParts[1]);

            var modString = lines.get(3).substring("  Test: divisible by ".length());
            var trueMonkeyString = lines.get(4).substring("    If true: throw to monkey ".length());
            var falseMonkeyString = lines.get(5).substring("    If false: throw to monkey ".length());
            test = new Test(
                    Integer.parseInt(modString),
                    Integer.parseInt(trueMonkeyString),
                    Integer.parseInt(falseMonkeyString)
            );
        }

        public ArrayList<ThrowItem> takeTurnDecreaseWorry(int scale) {
            var toThrow = new ArrayList<ThrowItem>();

            if (items.isEmpty()) return toThrow;

            for (var item : items) {
                item = operation.apply(item);
                item = item / scale;
                var monkeyGetsItem = test.apply(item);
                toThrow.add(new ThrowItem(monkeyGetsItem, item));
            }

            inspectCount += items.size();
            items.clear();
            return toThrow;
        }

        public ArrayList<ThrowItem> takeTurnMod(long mod) {
            var toThrow = new ArrayList<ThrowItem>();

            if (items.isEmpty()) return toThrow;

            for (var item : items) {
                item = operation.apply(item);
                item = item % mod;
                var monkeyGetsItem = test.apply(item);
                toThrow.add(new ThrowItem(monkeyGetsItem, item));
            }

            inspectCount += items.size();
            items.clear();
            return toThrow;
        }

        public void giveItem(long item) {
            items.add(item);
        }

        public int getInspectCount() {
            return inspectCount;
        }

        public int getTestMod() {
            return test.mod;
        }

    }

    public record ThrowItem(int toMonkey, long item) {  }

    private record Test(int mod, int monkeyIfTrue, int monkeyIfFalse) {
        public int apply(long worryLevel) {
            return (worryLevel % mod == 0) ? monkeyIfTrue : monkeyIfFalse;
        }
    }

    private enum Op { ADD, MUL, SQR }

    private record Operation(Op op, int operand) {

        private Operation(Operation toCopy) {
            this(toCopy.op, toCopy.operand);
        }

        public Operation(String op, String operand) {
            this(make(op, operand));
        }

        private static Operation make(String op, String operand) {
            var op_ = op.equals("+") ? Op.ADD : Op.MUL;

            if (operand.equals("old")) {
                op_ = switch (op_) {
                    case ADD -> Op.MUL;
                    case MUL -> Op.SQR;
                    default -> throw new InputMismatchException("Was expecting a \"+\" or a \"*\".");
                };
            }

            if (op_ == Op.SQR) {
                return new Operation(op_, 0);
            }

            return new Operation(op_, Integer.parseInt(operand));
        }



        public long apply(long x) {
            return switch (op) {
                case ADD -> x + operand;
                case MUL -> x * operand;
                case SQR -> x * x;
            };
        }

    }

}
