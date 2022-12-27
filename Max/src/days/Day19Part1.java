package days;

import days.Day19Common.Blueprint;
import days.Day19Common.Cost;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.Stack;

public class Day19Part1 implements GenericDay {

    private int answer = 0;


    public Day19Part1(RunType runType) {
        File inputFile = getFile(runType, 19);

        var blueprintParser = new Day19Common.BlueprintParser();
        new ReadLines(inputFile, blueprintParser::readLine).readFile();
        var blueprints = blueprintParser.getBlueprints();

        for (int i = 0; i < blueprints.size(); i++) {
            var maxGeodes = calcMaxGeodes(blueprints.get(i));
            System.out.println("Blueprint " + i + " made " + maxGeodes + " geodes.");
            answer += maxGeodes * (i + 1);
        }
    }

    private int calcMaxGeodes(Blueprint blueprint) {
        Stack<Moment> branches = new Stack<>();
        final int maxOreNeeded = Integer.max(Integer.max(Integer.max(
                                blueprint.getOreRobot().ore(), blueprint.getClayRobot().ore()),
                        blueprint.getObsidianRobot().ore()),
                blueprint.getGeodeRobot().ore()
        );
        final int maxClayNeeded = blueprint.getObsidianRobot().clay();
        final int maxObsidianNeeded = blueprint.getGeodeRobot().obsidian();

        branches.add(new Moment(
                1,
                0,
                new Cost(0, 0, 0),
                new RobotCount(1, 0, 0, 0)
        ));

        int max = 0;

        while (!branches.isEmpty()) {
            var branch = branches.pop();
            var hasMadeARobot = false;

            if (branch.time == 24) {
                max = Integer.max(max, branch.geodes);
                System.out.println("Current most geodes: " + max);
                continue;
            }

            branch = branch.getIncome();

            if (branch.robotCount.ore < maxOreNeeded && branch.bank.canAfford(blueprint.getOreRobot())) {
                branches.add(branch.buyOreRobot(blueprint.getOreRobot()));
                hasMadeARobot = true;
            }

            if (branch.robotCount.clay < maxClayNeeded && branch.bank.canAfford(blueprint.getClayRobot())) {
                branches.add(branch.buyClayRobot(blueprint.getClayRobot()));
                hasMadeARobot = true;
            }

            if (branch.robotCount.obsidian < maxObsidianNeeded && branch.bank.canAfford(blueprint.getObsidianRobot())) {
                branches.add(branch.buyObsidianRobot(blueprint.getObsidianRobot()));
                hasMadeARobot = true;
            }

            if (branch.bank.canAfford(blueprint.getGeodeRobot())) {
                branches.add(branch.buyGeodeRobot(blueprint.getGeodeRobot()));
                hasMadeARobot = true;
            }

            if (branch.bank.ore() < maxOreNeeded || hasMadeARobot) {
                branches.add(branch);
            }
        }

        return max;
    }



    public int getAnswer() {
        return answer;
    }



    private record Moment(int time, int geodes, Cost bank, RobotCount robotCount) {
        public Moment getIncome() {
            return new Moment(
                    time + 1,
                    geodes + robotCount.geode,
                    new Cost(
                            bank.ore() + robotCount().ore(),
                            bank.clay() + robotCount().clay(),
                            bank.obsidian() + robotCount().obsidian()
                    ),
                    robotCount
            );
        }

        public Moment buyOreRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    robotCount.addOre()
            );
        }

        public Moment buyClayRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    robotCount.addClay()
            );
        }

        public Moment buyObsidianRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    robotCount.addObsidian()
            );
        }

        public Moment buyGeodeRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    robotCount.addGeode()
            );
        }
    }

    private record RobotCount(int ore, int clay, int obsidian, int geode) {
        public RobotCount addOre() {
            return new RobotCount(ore + 1, clay, obsidian, geode);
        }

        public RobotCount addClay() {
            return new RobotCount(ore, clay + 1, obsidian, geode);
        }

        public RobotCount addObsidian() {
            return new RobotCount(ore, clay, obsidian + 1, geode);
        }

        public RobotCount addGeode() {
            return new RobotCount(ore, clay, obsidian, geode + 1);
        }
    }



    public static void main(String[] args) {
        var day = new Day19Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
