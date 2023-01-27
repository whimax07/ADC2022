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
        var count = 0;

        var possessBranches = new PossessBranches(blueprint, pastMoments, maxGeodes);
        while (possessBranches.hasBranchesToProcess()) {
            possessBranches.process();
            System.out.println("Pass " + (++count));
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
            var timeNeeded = calcTimeNeeded(robotCost, moment.bank, moment.robotCount);
            
            if (moment.time + timeNeeded >= 24) {
                bestScore = Integer.max(bestScore, moment.geodes + (24 - moment.time) * moment.robotCount.geode);
                return;
            }
            
            var newBank = Cost.subtract(
                    Cost.add(moment.bank, moment.robotCount.incomeGenerated(timeNeeded)),
                    robotCost
            );

            newBranches.add(new Moment(
                    moment.time + timeNeeded,
                    moment.geodes + timeNeeded * moment.robotCount.geode,
                    newBank,
                    addRobot.apply(moment.robotCount)
            ));
        }

        private static int calcTimeNeeded(Cost robotCost, Cost bank, RobotCount income) {
            var incomeNeeded = Cost.subtract(robotCost, bank);

            int timeNeeded = 0;

            // 100_000 is returned if the income for any resource is 0 and a non-zero amount is needed because 100_000
            // is more than 24, the time we have, and therefore a value that will fail the has time check without any
            // risk of overflow.

            if (incomeNeeded.ore() > 0) {
                if (income.ore == 0) return 100_000;
                timeNeeded = Integer.max(timeNeeded, incomeNeeded.ore() / income.ore);
            }

            if (incomeNeeded.clay() > 0) {
                if (income.clay == 0) return 100_000;
                timeNeeded = Integer.max(timeNeeded, incomeNeeded.clay() / income.clay);
            }

            if (incomeNeeded.obsidian() > 0) {
                if (income.obsidian == 0) return 100_000;
                timeNeeded = Integer.max(timeNeeded, incomeNeeded.obsidian() / income.obsidian);
            }
            
            return timeNeeded;
        }



        public int getBestScore() {
            return bestScore;
        }

        public boolean hasBranchesToProcess() {
            return !pastBranches.isEmpty();
        }

    }

    private record Moment(int time, int geodes, Cost bank, RobotCount robotCount) {  }

    private record RobotCount(int ore, int clay, int obsidian, int geode) {
        public Cost incomeGenerated(int time) {
            return new Cost(ore * time, clay * time, obsidian * time);
        }

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
