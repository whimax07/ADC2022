package days;

import days.Day16Common.Valve;
import days.Day16Common.Path;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.*;

public class Day16Part1 implements GenericDay {

    private final long answer;

    private final List<Integer> rates;

    private final Valve entrance;

    private Path bestPath;

    private final Stack<Branch> branches = new Stack<>();



    public Day16Part1(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        if (!graph.allDestinationsMapped()) throw new RuntimeException();

        rates = graph.getRates();
        rates.sort(Integer::compareTo);
        Collections.reverse(rates);
        entrance = graph.getEntrance();

        bestPath = new Baseline(rates).getBaseline();

        findBestPath();

        answer = bestPath.getArchived();
    }

    private void findBestPath() {
        branches.add(new Branch(
                new Path(rates),
                entrance,
                1
        ));

        while (!branches.isEmpty()) {
            var branch = branches.pop();
            followBranch(branch);
        }
    }

    public void followBranch(Branch branch) {
        assert(branch.time <= 30);
        if (branch.path.hasOpenedAllValves() || branch.time == 30) {
            int endVal = branch.path.calculateEndValue();
            if (endVal > bestPath.getArchived()) {
                bestPath = branch.path;
            }
            return;
        }

        if (!branch.path.canExceed(bestPath.getArchived(), branch.time)) return;

        for (var destination : branch.currentValve.getDestinations()) {
            var newPath = branch.path.copy();
            newPath.visitValve(destination);

            branches.add(new Branch(
                    newPath,
                    destination,
                    branch.time + 1
            ));
        }

        if (branch.path.hasNotOpenedValve(branch.currentValve) && branch.currentValve.getRate() > 0) {
            var newPath = branch.path.copy();
            newPath.openValve(branch.currentValve, branch.time);

            // This branch is checked if it can exceed the current best when it is passed to this function as `branch`.
            branches.add(new Branch(
                    newPath,
                    branch.currentValve,
                    branch.time + 1
            ));
        }
    }



    public long getAnswer() {
        return answer;
    }



    private class Baseline {

        private int time = 1;

        private final Path path;

        private Valve currentValve = entrance;



        public Baseline(List<Integer> rates) {
            path = new Path(rates);

            while (time <= 30) {
                tick();
            }
        }

        private void tick() {
            if (currentValve.getRate() != 0 && path.hasNotOpenedValve(currentValve)) {
                path.openValve(currentValve, time);
                time ++;
                return;
            }

            // Find the best next valve to visit.
            var next = currentValve.getDestinations().stream()
                    .filter(path::hasNotVisitedValve)
                    .filter(path::hasNotOpenedValve)
                    .filter(x -> x.getRate() > 0)
                    .max(Comparator.comparing(Valve::getRate));

            // If there isn't a best choose one we haven't been to before.
            if (next.isEmpty()) {
                next = currentValve.getDestinations().stream()
                        .filter(path::hasNotVisitedValve)
                        .findAny();
            }

            // Just pick a valve.
            if (next.isEmpty()) {
                var destinations = currentValve.getDestinations();
                var index = time % destinations.size();
                Valve randomValve = destinations.get(index);
                next = Optional.ofNullable(randomValve);
            }

            var nextValve = next.orElseThrow();

            currentValve = nextValve;
            path.visitValve(nextValve);
            time ++;
        }

        public Path getBaseline() {
            return path;
        }

    }

    private record Branch(Path path, Valve currentValve, int time) {  }



    public static void main(String[] args) {
        var day = new Day16Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
