package days;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.regex.Pattern;

public class Day19Common {

    public static class BlueprintParser {

        private final ArrayList<Blueprint> blueprints = new ArrayList<>();



        public void readLine(String line) {
            var blueprint = new Blueprint();

            final var pattern = Pattern.compile(
                    "Blueprint \\d+: " +
                            "Each ore robot costs (\\d+) ore. " +
                            "Each clay robot costs (\\d+) ore. " +
                            "Each obsidian robot costs (\\d+) ore and (\\d+) clay. " +
                            "Each geode robot costs (\\d+) ore and (\\d+) obsidian."
            );
            var matcher = pattern.matcher(line);

            if (!matcher.matches()) throw new InputMismatchException();
            assert(matcher.groupCount() == 6);

            int oreNeeded = Integer.parseInt(matcher.group(1));
            blueprint.setOreRobot(new Cost(oreNeeded, 0, 0));

            oreNeeded = Integer.parseInt(matcher.group(2));
            blueprint.setClayRobot(new Cost(oreNeeded, 0, 0));

            oreNeeded = Integer.parseInt(matcher.group(3));
            var clayNeeded = Integer.parseInt(matcher.group(4));
            blueprint.setObsidianRobot(new Cost(oreNeeded, clayNeeded, 0));

            oreNeeded = Integer.parseInt(matcher.group(5));
            var obsidianNeeded = Integer.parseInt(matcher.group(6));
            blueprint.setGeodeRobot(new Cost(oreNeeded, 0, obsidianNeeded));

            blueprints.add(blueprint);
        }

        public ArrayList<Blueprint> getBlueprints() {
            return blueprints;
        }

    }

    public static class Blueprint {

        private Cost oreRobot;

        private Cost clayRobot;

        private Cost obsidianRobot;

        private Cost geodeRobot;



        public Cost getOreRobot() {
            return oreRobot;
        }

        public void setOreRobot(Cost oreRobot) {
            this.oreRobot = oreRobot;
        }

        public Cost getClayRobot() {
            return clayRobot;
        }

        public void setClayRobot(Cost clayRobot) {
            this.clayRobot = clayRobot;
        }

        public Cost getObsidianRobot() {
            return obsidianRobot;
        }

        public void setObsidianRobot(Cost obsidianRobot) {
            this.obsidianRobot = obsidianRobot;
        }

        public Cost getGeodeRobot() {
            return geodeRobot;
        }

        public void setGeodeRobot(Cost geodeRobot) {
            this.geodeRobot = geodeRobot;
        }

    }

    public record Cost(int ore, int clay, int obsidian) {
        public static Cost add(Cost lhs, Cost rhs) {
            return new Cost(lhs.ore + rhs.ore, lhs.clay + rhs.clay, lhs.obsidian + rhs.obsidian);
        }

        public static Cost subtract(Cost lhs, Cost rhs) {
            return new Cost(lhs.ore - rhs.ore, lhs.clay - rhs.clay, lhs.obsidian - rhs.obsidian);
        }
    }

}
