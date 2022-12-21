package days;

import java.util.*;
import java.util.regex.Pattern;

public class Day16Common {

    public static class Graph {

        private final HashMap<String, Node> nameToNode = new HashMap<>();

        private final ArrayList<Integer> rates = new ArrayList<>();

        private Node entrance = null;



        public void readLine(String line) {
            final var pattern = Pattern.compile(
                    "Valve (\\p{Alpha}{2}) has flow rate=(\\d+); tunnels? leads? to valves? ((?:\\w{2}(?:, )?)+)"
            );
            var matcher = pattern.matcher(line);

            if (!matcher.matches()) throw new RuntimeException();
            if (matcher.groupCount() != 3) throw new InputMismatchException("Regex capture failure.");

            var node = nameToNode.computeIfAbsent(matcher.group(1), Node::new);
            if (matcher.group(1).equals("AA")) entrance = node;

            var rateString = matcher.group(2);
            int rate = Integer.parseInt(rateString);
            node.assignRate(rate);
            rates.add(rate);

            var destinations = matcher.group(3).split(", ");
            for (var destination : destinations) {
                var destNode = nameToNode.computeIfAbsent(destination.trim(), Node::new);
                node.addDestination(destNode);
            }
        }

        public boolean allDestinationsMapped() {
            for (var node : nameToNode.values()) {
                if (node.destinations.size() == 0) return false;
            }

            return true;
        }

        public Node getEntrance() {
            return entrance;
        }

        public List<Integer> getRates() {
            return rates;
        }

    }

    public static class Path {

        private final List<Integer> rates;

        private final ArrayList<Node> path = new ArrayList<>();

        private final HashSet<Node> openValues = new HashSet<>();

        private int growthRate = 0;

        private int currentlyArchived = 0;

        private int lastTime = 0;



        public Path(List<Integer> rates) {
            this.rates = new LinkedList<>(rates);
        }

        public boolean canExceed(int currentBest, int time) {
            assert(time <= 30);
            var currently = currentlyArchived + (time - lastTime) * growthRate;
            var steadyStateEnd = currently + growthRate * (30 - time);

            var maxRemaining = 0;
            var rateItr = rates.iterator();

            for (int i = 30 - time; i > 0; i -= 2) {
                if (!rateItr.hasNext()) break;

                var rate = rateItr.next();
                maxRemaining += rate * i;
            }

            return currentBest < steadyStateEnd + maxRemaining;
        }

        public int calculateEndValue() {
            currentlyArchived += (30 - lastTime) * growthRate;
            lastTime = 30;
            return currentlyArchived;
        }

        public void openValve(Node valve, int currentTime) {
            currentlyArchived += growthRate * (currentTime - lastTime);
            growthRate += valve.rate;

            lastTime = currentTime;
            path.add(valve);
            openValues.add(valve);
            rates.remove((Object) valve.rate);
        }

        public void visitValve(Node valve) {
            path.add(valve);
        }

        public boolean hasNotVisitedValve(Node valve) {
            return !path.contains(valve);
        }

        public boolean hasNotOpenedValve(Node valve) {
            return !openValues.contains(valve);
        }

        public ArrayList<Node> getPath() {
            return path;
        }

        public int getArchived() {
            return currentlyArchived;
        }

        public boolean hasOpenedAllValves() {
            return rates.isEmpty();
        }



        public Path copy() {
            var copy = new Path(rates);
            copy.path.addAll(path);
            copy.openValues.addAll(openValues);
            copy.growthRate = growthRate;
            copy.currentlyArchived = currentlyArchived;
            copy.lastTime = lastTime;

            return copy;
        }

        @Override
        public String toString() {
            return "Path" + path;
        }

    }

    public static class Route {

        private final ArrayList<Node> manRoute = new ArrayList<>();

        private final ArrayList<Node> elephantRoute = new ArrayList<>();

        private final List<Integer> rates;

        private final HashSet<Node> openValues = new HashSet<>();

        private int growthRate = 0;

        private int currentlyArchived = 0;

        private int lastTime = 0;



        public Route(List<Integer> rates) {
            this.rates = new LinkedList<>(rates);
        }

        public Route(List<Integer> rates, Node entrance) {
            this.rates = new LinkedList<>(rates);
            manRoute.add(entrance);
            elephantRoute.add(entrance);
            rates.remove((Object) 0);
        }



        public void update(Node man, Node elephant, int time) {
            var lastMan = manRoute.get(manRoute.size() - 1);
            var lastElephant = elephantRoute.get(elephantRoute.size() - 1);

            if (lastMan.equals(man) && lastElephant.equals(elephant)) {
                assert(!man.equals(elephant));

                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += man.rate;
                growthRate += elephant.rate;
                rates.remove((Object) man.rate);
                rates.remove((Object) elephant.rate);
                openValues.add(man);
                openValues.add(elephant);
                return;
            }

            if (lastMan.equals(man)) {
                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += man.rate;
                rates.remove((Object) man.rate);
                openValues.add(man);
                elephantRoute.add(elephant);
                return;
            }

            if (lastElephant.equals(elephant)) {
                currentlyArchived += growthRate * (time - lastTime);
                lastTime = time;
                growthRate += elephant.rate;
                rates.remove((Object) elephant.rate);
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

            return currentBest < steadyStateEnd + maxRemaining;
        }

        public boolean isFirstVisit(Node valve) {
            return !(elephantRoute.contains(valve) || manRoute.contains(valve));
        }

        public boolean isShut(Node valve) {
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

        public Node getLastMan() {
            return manRoute.get(manRoute.size() - 1);
        }

        public Node getLastElephant() {
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

    public static class Node {

        private final String name;

        private int rate = -1;

        private final ArrayList<Node> destinations = new ArrayList<>();



        public Node(String s) {
            name = s;
        }

        public void assignRate(int rate) {
            this.rate = rate;
        }

        public void addDestination(Node destNode) {
            destinations.add(destNode);
        }

        public ArrayList<Node> getDestinations() {
            return destinations;
        }

        public int getRate() {
            return rate;
        }

        @Override
        public String toString() {
            return "Node{ " + name + " }";
        }

    }

}
