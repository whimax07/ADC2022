package days;

import java.util.*;
import java.util.regex.Pattern;

public class Day16Common {

    public static class Graph {

        private final HashMap<String, Valve> nameToValve = new HashMap<>();

        private final ArrayList<Integer> rates = new ArrayList<>();

        private Valve entrance = null;



        public void readLine(String line) {
            final var pattern = Pattern.compile(
                    "Valve (\\p{Alpha}{2}) has flow rate=(\\d+); tunnels? leads? to valves? ((?:\\w{2}(?:, )?)+)"
            );
            var matcher = pattern.matcher(line);

            if (!matcher.matches()) throw new RuntimeException();
            if (matcher.groupCount() != 3) throw new InputMismatchException("Regex capture failure.");

            var node = nameToValve.computeIfAbsent(matcher.group(1), Valve::new);
            if (matcher.group(1).equals("AA")) entrance = node;

            var rateString = matcher.group(2);
            int rate = Integer.parseInt(rateString);
            node.assignRate(rate);
            rates.add(rate);

            var destinations = matcher.group(3).split(", ");
            for (var destination : destinations) {
                var destNode = nameToValve.computeIfAbsent(destination.trim(), Valve::new);
                node.addDestination(destNode);
            }
        }

        public boolean allDestinationsMapped() {
            for (var valve : nameToValve.values()) {
                if (valve.destinations.size() == 0) return false;
            }

            return true;
        }

        public Valve getEntrance() {
            return entrance;
        }

        public List<Integer> getRates() {
            return rates;
        }

        public ArrayList<Valve> getValves() {
            return new ArrayList<>(nameToValve.values());
        }

    }

    public static class CompleteGraph {

        private final ArrayList<Valve> valves;

        private final ArrayList<Node> nodes = new ArrayList<>();

        private final HashMap<Valve, Node> valveNodeMap = new HashMap<>();

        private final Node entrance;



        public CompleteGraph(Graph graph) {
            this.valves = graph.getValves();

            makeNodes();
            findAllDistances();

            entrance = new Node(graph.entrance.name, graph.entrance.rate);
            valveNodeMap.put(graph.entrance, entrance);
            findDistances(graph.entrance, nodes.size() + 1);
            valveNodeMap.remove(graph.entrance);
        }

        private void makeNodes() {
            for (var valve : valves) {
                if (valve.rate > 0) {
                    Node node = new Node(valve.name, valve.rate);
                    nodes.add(node);
                    valveNodeMap.put(valve, node);
                }
            }
        }

        private void findAllDistances() {
            for (var valve : valveNodeMap.keySet()) {
                findDistances(valve, nodes.size());
            }
        }

        private void findDistances(Valve start, int numNodes) {
            var startNode = valveNodeMap.get(start);

            var visitedValves = new HashSet<Valve>();
            visitedValves.add(start);

            var nodeCount = 1;

            // Init the stack with items adjacent to the `start` valve/node.
            var stack = new Stack<Traversal>();
            for (var dest : start.destinations) stack.add(new Traversal(dest, 1));

            while (!stack.isEmpty() && nodeCount < numNodes) {
                var traversal = stack.pop();

                if (visitedValves.contains(traversal.valve)) continue;
                visitedValves.add(traversal.valve);

                if (valveNodeMap.containsKey(traversal.valve)) {
                    var node = valveNodeMap.get(traversal.valve);
                    // We add one to the distance for the extra work to open a valve.
                    startNode.getDistanceMap().put(node, traversal.distance + 1);
                    nodeCount ++;
                }

                for (var dest : traversal.valve.destinations) {
                    stack.add(new Traversal(dest, traversal.distance + 1));
                }
            }
        }



        public ArrayList<Node> getNodes() {
            return nodes;
        }

        public Node getEntrance() {
            return entrance;
        }



        private record Traversal(Valve valve, int distance) {  }

    }

    public static class Path {

        private final List<Integer> rates;

        private final ArrayList<Valve> path = new ArrayList<>();

        private final HashSet<Valve> openValues = new HashSet<>();

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

        public void openValve(Valve valve, int currentTime) {
            currentlyArchived += growthRate * (currentTime - lastTime);
            growthRate += valve.rate;

            lastTime = currentTime;
            path.add(valve);
            openValues.add(valve);
            rates.remove((Object) valve.rate);
        }

        public void visitValve(Valve valve) {
            path.add(valve);
        }

        public boolean hasNotVisitedValve(Valve valve) {
            return !path.contains(valve);
        }

        public boolean hasNotOpenedValve(Valve valve) {
            return !openValues.contains(valve);
        }

        public ArrayList<Valve> getPath() {
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

    public static class Valve {

        private final String name;

        private int rate = -1;

        private final ArrayList<Valve> destinations = new ArrayList<>();



        public Valve(String s) {
            name = s;
        }

        public void assignRate(int rate) {
            this.rate = rate;
        }

        public void addDestination(Valve destValve) {
            destinations.add(destValve);
        }

        public ArrayList<Valve> getDestinations() {
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

    public static class Node {

        private final String name;

        private final HashMap<Node, Integer> distanceMap = new HashMap<>();

        private final int rate;


        public Node(String name, int rate) {
            this.name = name;
            this.rate = rate;
        }


        public String getName() {
            return name;
        }

        public HashMap<Node, Integer> getDistanceMap() {
            return distanceMap;
        }

        public int getRate() {
            return rate;
        }

        @Override
        public String toString() {
            return "Node{" + name + '}';
        }
    }

}
