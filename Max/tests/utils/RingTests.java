package utils;

import org.junit.jupiter.api.Test;

import java.util.HashMap;

import static org.junit.jupiter.api.Assertions.*;

public class RingTests {

    @Test
    public void pushBackTest() {
        var ring = new Ring<Integer>();

        ring.pushBack(0);
        assertEquals(0, ring.get(0));
        assertEquals(1, ring.size());

        ring.pushBack(1);
        assertEquals(1, ring.get(1));
        assertEquals(2, ring.size());

        ring.pushBack(2);
        assertEquals(2, ring.get(2));
        assertEquals(3, ring.size());
    }

    @Test
    public void swapTest() {
        var map = new HashMap<Integer, Ring.Node<Integer>>();
        var ring = new Ring<Integer>();
        map.put(0, ring.pushBack(0));
        map.put(1, ring.pushBack(1));
        map.put(2, ring.pushBack(2));
        map.put(3, ring.pushBack(3));
        map.put(4, ring.pushBack(4));

        // No change
        ring.insertAfter(map.get(1), map.get(2));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);

        // Swapping its self.
        ring.insertAfter(map.get(1), map.get(1));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);

        // Moving a (..., a, b, ...) to (..., b, c, ...).
        ring.insertAfter(map.get(2), map.get(1));
        assertRingValuesSame(ring, 0, 2, 1, 3, 4);

        // Undoing the above move.
        ring.insertAfter(map.get(1), map.get(2));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);

        // Swapping the tail.
        ring.insertAfter(map.get(4), map.get(3));
        assertRingValuesSame(ring, 0, 1, 2, 4, 3);
        ring.insertAfter(map.get(3), map.get(4));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);

        // Swapping the head.
        ring.insertAfter(map.get(1), map.get(0));
        assertRingValuesSame(ring, 1, 0, 2, 3, 4);
        ring.insertAfter(map.get(0), map.get(1));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);

        // Swap the head and the tail. (No change as head.previous == tail.next)
        ring.insertAfter(map.get(4), map.get(0));
        assertRingValuesSame(ring, 0, 1, 2, 3, 4);
    }



    private static void assertRingValuesSame(Ring<Integer> toTest, int... expected) {
        if (toTest.size() != expected.length) fail("ToTest and expected had a different number of elements.\n" +
                "Expected: " + expected.length + ", Actual: " + toTest.size() + "\n" +
                "Failed: " + toTest);

        for (int i = 0; i < expected.length; i++) {
            if (toTest.get(i) != expected[i]) fail("The " + i + " element differs.\n" +
                    "Expected: " + expected[i] + ", Actual: " + toTest.get(i) + "\n" +
                    "Failed: " + toTest);
        }
    }

}
