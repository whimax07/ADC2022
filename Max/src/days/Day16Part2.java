package days;

import days.Day16Common.Node;
import days.Day16Common.Route;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.*;

public class Day16Part2 implements GenericDay {

    private final List<Integer> rates;

    private final Node entrance;

    private Route bestRoute;

    private final Stack<Branch> branches = new Stack<>();

    private final long answer;

    private int count = 0;



    public Day16Part2(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        rates = graph.getRates();
        rates.sort(Integer::compareTo);
        Collections.reverse(rates);

        entrance = graph.getEntrance();

        bestRoute = new Baseline(rates).getBaseline();
        System.out.println(bestRoute.displayString());

        findBestPath();

        answer = bestRoute.getArchived();
    }

    private void findBestPath() {
        branches.add(new Branch(
                new Route(rates, entrance),
                1
        ));


        while (!branches.isEmpty()) {
            followBranch(branches.pop());
        }
    }

    private void followBranch(Branch branch) {
        if (++count == 500) {
            count = 0;
            System.out.println(branch.route.displayString());
        }


        if (branch.time == 26 || branch.route.allWorkingValvesOpen()) {
            var endValue = branch.route.calculateFinalValue();

            if (endValue > bestRoute.getArchived()) {
                bestRoute = branch.route;
                System.out.println(bestRoute.displayString());
            }

            return;
        }

        if (!branch.route.canExceed(bestRoute.getArchived(), branch.time)) return;

        var route = branch.route;
        Node lastMan = route.getLastMan();
        Node lastElephant = route.getLastElephant();

        // Progress both.
        for (var eDest : lastElephant.getDestinations()) {
            for (var mDest : lastMan.getDestinations()) {
                var newRoute = route.copy();

                newRoute.update(mDest, eDest, branch.time);
                branches.add(new Branch(newRoute, branch.time + 1));
            }
        }

        var couldOpenMan = route.isShut(lastMan) && lastMan.getRate() > 0;
        var couldOpenElephant = route.isShut(lastElephant) && lastElephant.getRate() > 0;

        // Open the valve the man is at.
        if (couldOpenMan) {
            for (var eDest : lastElephant.getDestinations()) {
                var newRoute = route.copy();
                newRoute.update(lastMan, eDest, branch.time);
                branches.add(new Branch(newRoute, branch.time + 1));
            }
        }

        // Open the valve the elephant is at.
        if (couldOpenElephant) {
            for (var mDest : lastMan.getDestinations()) {
                var newRoute = route.copy();
                newRoute.update(mDest, lastElephant, branch.time);
                branches.add(new Branch(newRoute, branch.time + 1));
            }
        }

        // Open both valves.
        if (couldOpenMan && couldOpenElephant && !lastMan.equals(lastElephant)) {
            var newRoute = route.copy();
            newRoute.update(lastMan, lastElephant, branch.time);
            branches.add(new Branch(newRoute, branch.time + 1));
        }
    }



    public long getAnswer() {
        return answer;
    }



    private record Branch(Route route, int time) {  }

    private class Baseline {

        private int time = 1;

        private final Route route;



        public Baseline(List<Integer> rates) {
            route = new Route(rates, entrance);

            while (time <= 26 && !route.allWorkingValvesOpen()) {
                tick();
            }

            route.calculateFinalValue();
        }

        private void tick() {
            var lastMan = route.getLastMan();
            var lastElephant = route.getLastElephant();

            var couldOpenMan = route.isShut(lastMan) && lastMan.getRate() > 0;
            var couldOpenElephant = route.isShut(lastElephant) && lastElephant.getRate() > 0;

            if (couldOpenMan && couldOpenElephant && !lastMan.equals(lastElephant)) {
                route.update(lastMan, lastElephant, time);
                time ++;
                return;
            }

            if (couldOpenMan) {
                var nextElephant = bestNextValve(lastElephant, lastMan);
                route.update(lastMan, nextElephant, time);
                time ++;
                return;
            }

            if (couldOpenElephant) {
                var nextMan = bestNextValve(lastMan, lastElephant);
                route.update(nextMan, lastElephant, time);
                time ++;
                return;
            }

            var nextMan = bestNextValve(lastMan, lastElephant);
            var nextElephant = bestNextValve(lastElephant, lastMan);
            route.update(nextMan, nextElephant, time);
            time ++;
        }

        private Node bestNextValve(Node current, Node occupied) {
            var next = current.getDestinations().stream()
                    .filter(x -> !occupied.equals(x))
                    .filter(route::isShut)
                    .filter(x -> x.getRate() > 0)
                    .max(Comparator.comparing(Node::getRate));

            if (next.isEmpty()) {
                next = current.getDestinations().stream()
                        .filter(route::isFirstVisit)
                        .findFirst();
            }

            if (next.isEmpty()) {
                var destinations = current.getDestinations();
                var index = time % destinations.size();
                var randomValve = destinations.get(index);
                next = Optional.ofNullable(randomValve);
            }

            return next.orElseThrow();
        }



        public Route getBaseline() {
            return route;
        }

    }



    public static void main(String[] args) {
        var day = new Day16Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
