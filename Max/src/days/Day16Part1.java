package days;

import days.Day16Common.Node;
import days.Day16Common.Path;
import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.*;

public class Day16Part1 implements GenericDay {

    private final long answer;

    private final int maxRate;

    private final Node entrance;

    private Path bestPath;

    private final Stack<Branch> branches = new Stack<>();

    // TODO(Max): We can also add a way to reject paths if we detect a cycle and have been on a more optimum route
    //  before.
//    private HashMap<Node, Integer> activatedValues = new HashMap<>();



    public Day16Part1(RunType runType) {
        File inputFile = getFile(runType, 16);

        Day16Common.Graph graph = new Day16Common.Graph();
        new ReadLines(inputFile, graph::readLine).readFile();

        if (!graph.allDestinationsMapped()) throw new RuntimeException();

        maxRate = graph.getMaxRate();
        entrance = graph.getEntrance();

        bestPath = new Baseline().getBaseline();
        System.out.println("Baseline Path: " + bestPath);

        findBestPath();

        answer = bestPath.getArchived();
    }

    private void findBestPath() {
        branches.add(new Branch(
                new Path(maxRate),
                entrance,
                0
        ));

        while (!branches.isEmpty()) {
            var branch = branches.pop();
            followBranch(branch);
        }
    }

    private void followBranch(Branch branch) {
        var time = branch.time;
        var currentNode = branch.currentNode;
        var path = branch.path;

        var destinations = currentNode.getDestinations();

        if (currentNode.getRate() > 0 && path.hasNotOpenedValve(currentNode)) {
            var newPath = path.copy();
            newPath.openValve(currentNode, time);
            move(time + 1, newPath, destinations);
        }

        move(time, path, destinations);
    }

    private void move(int time, Path path, ArrayList<Node> destinations) {
        if (time >= 30) {
            if (path.getArchived() > bestPath.getArchived()) {
                bestPath = path;
                System.out.println(bestPath);
            }
            return;
        }

        for (var dest : destinations) {
            if (!path.canExceed(bestPath.getArchived(), 30 - time)) continue;

            var newPath = path.copy();
            newPath.visitValve(dest);

            branches.add(new Branch(
                    newPath,
                    dest,
                    time + 1
            ));
        }
    }


    public long getAnswer() {
        return answer;
    }



    private class Baseline {

        private int time = 0;

        private final Path path = new Path(maxRate);

        private Node currentNode = entrance;



        public Baseline() {
            while (time <= 30) {
                tick();
            }
        }

        private void tick() {
            if (currentNode.getRate() != 0 && !path.hasOpenedValve(currentNode)) {
                path.openValve(currentNode, time);
                time ++;
                return;
            }

            // Find the best next valve to visit.
            var next = currentNode.getDestinations().stream()
                    .filter(path::hasNotVisitedValve)
                    .filter(path::hasNotOpenedValve)
                    .filter(x -> x.getRate() > 0)
                    .max(Comparator.comparing(Node::getRate));

            // If there isn't a best choose one we haven't been to before.
            if (next.isEmpty()) {
                next = currentNode.getDestinations().stream()
                        .filter(path::hasNotVisitedValve)
                        .findAny();
            }

            // Just pick a valve.
            if (next.isEmpty()) {
                // Choose a random valve in the hope of escaping loops.
                final Random random = new Random();
                var destinations = currentNode.getDestinations();
                Node randomValve = destinations.get(random.nextInt(destinations.size()));
                next = Optional.ofNullable(randomValve);
            }

            var nextValve = next.orElseThrow();

            currentNode = nextValve;
            path.visitValve(nextValve);
            time ++;
        }

        public Path getBaseline() {
            return path;
        }

    }

    private record Branch(Path path, Node currentNode, int time) {  }



    public static void main(String[] args) {
        var day = new Day16Part1(RunType.Q);
        System.out.println(day.answer);
    }

}
