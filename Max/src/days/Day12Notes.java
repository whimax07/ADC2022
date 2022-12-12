package days;

import utils.v2i;

import java.util.Stack;

public class Day12Notes {

       private Stack<ToTry> directionsToTry = new Stack<>();





       private enum Direction { NORTH, EAST, SOUTH, WEST }

       private record ToTry(v2i pos, int dir) {  }

}
