package days;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Pattern;

public class Day16Common {

    public static class Graph {

        private final HashMap<String, Node> nameToNode = new HashMap<>();

        private Node entrance = null;

        private int maxRate = -1;



        public void readLine(String line) {
            var stringPos = "Valve ".length();
            var nodeName = line.substring(stringPos, stringPos + 2).trim();
            var node = nameToNode.computeIfAbsent(nodeName, Node::new);
            if (nodeName.equals("AA")) entrance = node;
            stringPos += 2;


            stringPos += " has flow rate=".length();
            final Pattern ratePattern = Pattern.compile(".+(\\d+).+");
            var rateMatch = ratePattern.matcher(line);
            if (!rateMatch.matches()) throw new RuntimeException();
            var rateString = rateMatch.group(1);

            int rate = Integer.parseInt(rateString);
            node.assignRate(rate);
            maxRate = Integer.max(maxRate, rate);
            stringPos += rateString.length();


            stringPos += "; tunnels lead to valves ".length();
            var destinations = line.substring(stringPos).split(", ");
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

        public int getMaxRate() {
            return maxRate;
        }

    }

    public static class Path {

        private final int maxRate;

        private final ArrayList<Node> path = new ArrayList<>();

        private final HashSet<Node> openValues = new HashSet<>();

        private int growthRate = 0;

        private int currentlyArchived = 0;

        private int lastTime = 0;



        public Path(int maxRate) {
            this.maxRate = maxRate;
        }

        public boolean canExceed(int currentBest, int timeRemaining) {
            assert(lastTime + timeRemaining <= 30);
            currentlyArchived += (30 - lastTime - timeRemaining) * growthRate;
            var steadyStateEnd = currentlyArchived + growthRate * timeRemaining;

            // NOTE(Max): This is a large over estimation, but it is fast to compute. I don't have a good idea of how
            // commutative complexity compares to earlier path rejection.
            var maxPossibleExtra = (maxRate * (maxRate + 1)) * timeRemaining;

            return currentBest < steadyStateEnd + maxPossibleExtra;
        }

        public Path openValve(Node valve, int currentTime) {
            currentlyArchived += growthRate * (currentTime - lastTime);
            growthRate += valve.rate;

            lastTime = currentTime;
            path.add(valve);
            openValues.add(valve);

            return this;
        }

        public Path visitValve(Node valve) {
            path.add(valve);
            return this;
        }

        public boolean hasVisitedValve(Node valve) {
            return path.contains(valve);
        }

        public boolean hasNotVisitedValve(Node valve) {
            return !path.contains(valve);
        }

        public boolean hasOpenedValve(Node valve) {
            return openValues.contains(valve);
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




        public Path copy() {
            var copy = new Path(maxRate);
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