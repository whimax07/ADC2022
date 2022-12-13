package days;

import java.util.ArrayList;
import java.util.function.BiConsumer;
import java.util.function.BiPredicate;

public class Day10Common {

    private record HookPair(BiPredicate<Long, Integer> check, BiConsumer<Long, Integer> hook) {  }

    public static class CPU {

        private final ArrayList<HookPair> hooks = new ArrayList<>();

        private long cycle = 0;

        private int regX = 1;

        public void addHook(
                BiPredicate<Long, Integer> cycleNumRegValueBiPredicate,
                BiConsumer<Long, Integer> cycleNumRegValueBiConsumer
        ) {
            hooks.add(new HookPair(cycleNumRegValueBiPredicate, cycleNumRegValueBiConsumer));
        }

        public void executeInstruction(String instruction) {
            if (instruction.equals("noop")) {
                cycle ++;
                checkHooks();
                return;
            }

            cycle ++;
            checkHooks();
            cycle ++;
            checkHooks();
            regX += Integer.parseInt(instruction.substring(5));
        }

        private void checkHooks() {
            for (var pair : hooks) {
                if (pair.check.test(cycle, regX)) {
                    pair.hook.accept(cycle, regX);
                }
            }
        }

    }

}
