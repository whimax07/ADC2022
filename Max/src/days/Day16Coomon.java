package days;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;

public class Day16Coomon {

    public static class Graph {

        private final HashMap<String, Node> nameToNode = new HashMap<>();

        private Node entrance = null;



        public void readLine(String line) {
            var pos = "Valve ".length();
            var nodeName = line.substring(pos, pos + 2);
            var node = nameToNode.computeIfAbsent(nodeName, Node::new);
            if (nodeName.equals("AA")) entrance = node;
            pos += 2;


            pos += " has flow rate=".length();
            var rateString = line.substring(pos);

            final Pattern ratePattern = Pattern.compile("^(\\d+).+");
            var rateMatch = ratePattern.matcher(rateString);
            rateString = rateMatch.group(1);

            node.assignRate(Integer.parseInt(rateString));
            pos += rateString.length();


            pos += "; tunnels lead to valves ".length();
            var destinations = line.substring(pos).split(", ");
            for (var destination : destinations) {
                var destNode = nameToNode.computeIfAbsent(destination, Node::new);
                node.addDestination(destNode);
            }
        }

        public Node getEntrance() {
            return entrance;
        }

    }

    public static class Node {

        private int rate = -1;

        private ArrayList<Node> destinations = new ArrayList<>();



        public Node() {  }

        public Node(String s) {  }

        public void assignRate(int rate) {
            this.rate = rate;
        }

        public int cacluateValue(int time) {
            return time * rate;
        }

        public void addDestination(Node destNode) {
            destinations.add(destNode);
        }

    }

}
