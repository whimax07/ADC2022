package days;

import days.Day16Common.Valve;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.*;

public class Day16Part2Attempt1 implements GenericDay {

    private final List<Integer> rates;

    private final Valve entrance;

    private Route bestRoute;

    private final Stack<Branch> branches = new Stack<>();

    private final long answer;

    private int count = 0;



    public Day16Part2Attempt1(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        rates = graph.getRates();
        rates.sort(Integer::compareTo);
        Collections.reverse(rates);

        entrance = graph.getEntrance();

        bestRoute = new Baseline(rates).getBaseline();
        System.out.println("baseline: " + bestRoute.displayString());
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
        if (++count == 500000) {
            count = 0;
            System.out.println(
                    "Rejection rate: " + (double) Route.rejectCount / (double) Route.rejectChecks
                    + " Mean rejection time: " + (double) Route.rejectionTime / (double) Route.rejectCount
            );
        }


        if (branch.time == 26 || branch.route.allWorkingValvesOpen()) {
            var endValue = branch.route.calculateFinalValue();

            if (endValue > bestRoute.getArchived()) {
                bestRoute = branch.route;
                System.out.println(bestRoute.displayString());
                Route.rejectCount = 0;
                Route.rejectionTime = 0;
                Route.rejectChecks = 0;
            }

            return;
        }

        if (!branch.route.canExceed(bestRoute.getArchived(), branch.time)) return;

        var route = branch.route;
        Valve lastMan = route.getLastMan();
        Valve lastElephant = route.getLastElephant();

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

        private Valve bestNextValve(Valve current, Valve occupied) {
            var next = current.getDestinations().stream()
                    .filter(x -> !occupied.equals(x))
                    .filter(route::isShut)
                    .filter(x -> x.getRate() > 0)
                    .max(Comparator.comparing(Valve::getRate));

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

    public static class Route {

        private final ArrayList<Valve> manRoute = new ArrayList<>();

        private final ArrayList<Valve> elephantRoute = new ArrayList<>();

        private final List<Integer> rates;

        private final HashSet<Valve> openValues = new HashSet<>();

        private int growthRate = 0;

        private int currentlyArchived = 0;

        private int lastTime = 0;

        public static long rejectCount = 0;

        public static long rejectChecks = 0;

        public static long rejectionTime = 0;



        public Route(List<Integer> rates) {
            this.rates = new LinkedList<>(rates);
        }

        public Route(List<Integer> rates, Valve entrance) {
            this.rates = new LinkedList<>(rates);
            manRoute.add(entrance);
            elephantRoute.add(entrance);
            rates.remove((Object) 0);
        }



        public void update(Valve man, Valve elephant, int time) {
            var lastMan = manRoute.get(manRoute.size() - 1);
            var lastElephant = elephantRoute.get(elephantRoute.size() - 1);

            if (lastMan.equals(man) && lastElephant.equals(elephant)) {
                assert(!man.equals(elephant));

                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += man.getRate();
                growthRate += elephant.getRate();
                rates.remove((Object) man.getRate());
                rates.remove((Object) elephant.getRate());
                openValues.add(man);
                openValues.add(elephant);
                return;
            }

            if (lastMan.equals(man)) {
                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += man.getRate();
                rates.remove((Object) man.getRate());
                openValues.add(man);
                elephantRoute.add(elephant);
                return;
            }

            if (lastElephant.equals(elephant)) {
                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += elephant.getRate();
                rates.remove((Object) elephant.getRate());
                openValues.add(elephant);
                manRoute.add(man);
                return;
            }

            manRoute.add(man);
            elephantRoute.add(elephant);
        }

        public boolean canExceed(int currentBest, int time) {
            var currently = currentlyArchived + (time - lastTime) * growthRate;
            var steadyStateEnd = currently + growthRate * (30 - time);

            var maxRemaining = 0;
            var rateItr = rates.iterator();

            for (int i = 26 - time; i > 0; i -= 2) {
                if (!rateItr.hasNext()) break;
                var rate = rateItr.next();
                maxRemaining += rate * i;

                if (!rateItr.hasNext()) break;
                rate = rateItr.next();
                maxRemaining += rate * i;
            }


            boolean out = currentBest < steadyStateEnd + maxRemaining;
            rejectChecks ++;
            if (!out) {
                rejectCount++;
                rejectionTime += time;
            }
            return out;
        }

        public boolean isFirstVisit(Valve valve) {
            return !(elephantRoute.contains(valve) || manRoute.contains(valve));
        }

        public boolean isShut(Valve valve) {
            return !openValues.contains(valve);
        }

        public boolean allWorkingValvesOpen() {
            return rates.isEmpty() || rates.get(0) == 0;
        }

        public int calculateFinalValue() {
            currentlyArchived += (26 - lastTime) * growthRate;
            return currentlyArchived;
        }

        public int getArchived() {
            return currentlyArchived;
        }

        public Valve getLastMan() {
            return manRoute.get(manRoute.size() - 1);
        }

        public Valve getLastElephant() {
            return elephantRoute.get(elephantRoute.size() - 1);
        }



        public String displayString() {
            return "Route{"
                    + " Archived:" + currentlyArchived
                    + " ManPath:" + manRoute
                    + " ElephantPath:" + elephantRoute
                    + " }";
        }

        public Route copy() {
            var copy = new Route(rates);
            copy.manRoute.addAll(manRoute);
            copy.elephantRoute.addAll(elephantRoute);
            copy.openValues.addAll(openValues);
            copy.growthRate = growthRate;
            copy.currentlyArchived = currentlyArchived;
            copy.lastTime = lastTime;

            return copy;
        }

    }



    public static void main(String[] args) {
        var day = new Day16Part2Attempt1(RunType.Q);
        System.out.println(day.answer);
    }

}
