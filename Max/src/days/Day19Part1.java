package days;

import days.Day19Common.Blueprint;
import days.Day19Common.Cost;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.Stack;
import java.util.function.Function;

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
        var pastMoments = new Stack<Moment>();
        pastMoments.add(new Moment(
                1,
                0,
                new Cost(0, 0, 0),
                new RobotCount(1, 0, 0, 0)
        ));
        var maxGeodes = 0;

        var possessBranches = new PossessBranches(blueprint, pastMoments, maxGeodes);
        while (possessBranches.hasBranchesToProcess()) {
            possessBranches.process();
        }

        return possessBranches.getBestScore();
    }



    public int getAnswer() {
        return answer;
    }



    private static class PossessBranches {

        private Stack<Moment> newBranches = new Stack<>();

        private int bestScore;

        private Stack<Moment> pastBranches;

        final Cost oreRobotCost;

        final Cost clayRobotCost;

        final Cost obsidianRobotCost;

        final Cost geodeRobotCost;

        final int maxOreNeeded;

        final int maxClayNeeded;

        final int maxObsidianNeeded;



        public PossessBranches(Blueprint blueprint, Stack<Moment> pastBranches, int bestScore) {
            this.bestScore = bestScore;
            this.pastBranches = pastBranches;

            oreRobotCost = blueprint.getOreRobot();
            clayRobotCost = blueprint.getClayRobot();
            obsidianRobotCost = blueprint.getObsidianRobot();
            geodeRobotCost = blueprint.getGeodeRobot();

            maxOreNeeded = Integer.max(
                    Integer.max(
                            Integer.max(
                                    oreRobotCost.ore(), clayRobotCost.ore()
                            ), obsidianRobotCost.ore()
                    ), geodeRobotCost.ore()
            );
            maxClayNeeded = obsidianRobotCost.clay();
            maxObsidianNeeded = geodeRobotCost.obsidian();
        }



        public void process() {
            while (!pastBranches.isEmpty()) {
                processBranch(pastBranches.pop());
            }

            pastBranches = newBranches;
            newBranches = new Stack<>();
        }

        private void processBranch(Moment moment) {
            if (moment.time == 24) {
                bestScore = Integer.max(bestScore, moment.geodes);
                return;
            }

            if (moment.robotCount.geode < maxOreNeeded) {
                makeBranch(moment, oreRobotCost, RobotCount::addOre);
            }

            if (moment.robotCount.clay < maxClayNeeded) {
                makeBranch(moment, clayRobotCost, RobotCount::addClay);
            }

            if (moment.robotCount.obsidian < maxObsidianNeeded) {
                makeBranch(moment, obsidianRobotCost, RobotCount::addObsidian);
            }

            makeBranch(moment, geodeRobotCost, RobotCount::addGeode);
        }

        private void makeBranch(Moment moment, Cost robotCost, Function<RobotCount, RobotCount> addRobot) {
            // What about having zero of a needed type of robot?
            var timeNeeded = (robotCost - moment.bank) / moment.robotCount;
            
            if (moment.time + timeNeeded >= 24) {
                bestScore = Integer.max(bestScore, moment.geodes + (24 - moment.time) * moment.robotCount.geode);
                return;
            }
            
            var newBank = moment.bank + (moment.robotCount * timeNeeded) - robotCost;

            newBranches.add(new Moment(
                    moment.time + timeNeeded,
                    moment.geodes + timeNeeded * moment.robotCount.geode,
                    newBank,
                    addRobot.apply(moment.robotCount)
            ));
        }



        public int getBestScore() {
            return bestScore;
        }

        public boolean hasBranchesToProcess() {
            return !pastBranches.isEmpty();
        }

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
                    RobotCount.addOre(robotCount)
            );
        }

        public Moment buyClayRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    RobotCount.addClay(robotCount)
            );
        }

        public Moment buyObsidianRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    RobotCount.addObsidian(robotCount)
            );
        }

        public Moment buyGeodeRobot(Cost price) {
            return new Moment(
                    time,
                    geodes,
                    bank.buy(price),
                    RobotCount.addGeode(robotCount)
            );
        }
    }

    private record RobotCount(int ore, int clay, int obsidian, int geode) {
        public static RobotCount addOre(RobotCount self) {
            return new RobotCount(self.ore + 1, self.clay, self.obsidian, self.geode);
        }

        public static RobotCount addClay(RobotCount self) {
            return new RobotCount(self.ore, self.clay + 1, self.obsidian, self.geode);
        }

        public static RobotCount addObsidian(RobotCount self) {
            return new RobotCount(self.ore, self.clay, self.obsidian + 1, self.geode);
        }

        public static RobotCount addGeode(RobotCount self) {
            return new RobotCount(self.ore, self.clay, self.obsidian, self.geode + 1);
        }
    }



    public static void main(String[] args) {
        var day = new Day19Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
