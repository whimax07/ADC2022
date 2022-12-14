package days;

import java.util.ArrayList;

public class Day13Common {

    public interface Packet {}

    public static class PList extends ArrayList<Packet> implements Packet {  }

    public record PInt(int v) implements Packet {  }

}
