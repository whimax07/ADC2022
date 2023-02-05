package utils;

import java.util.Optional;

public class Ring<E> {

    private Node<E> head;

    private Node<E> tail;

    private int count = 0;



    public Node<E> pushBack(E value) {
        var newNode = new Node<>(value);

        if (count == 0) {
            head = newNode;
        } else {
            tail.next = newNode;
            newNode.previous = tail;
        }
        tail = newNode;

        // The head loops back around.
        head.previous = tail;
        tail.next = head;

        count ++;
        return newNode;
    }

    public void insertAfter(Node<E> dest, Node<E> insert) {
        if (dest == null || insert == null) throw new RuntimeException("Both the node next to insertion and the node " +
                "to be placed must not be null.");
        if (count <= 1) throw new RuntimeException("There must be at least two nodes for inserting one after the " +
                "to be a sensible operation.");
        if (dest == insert) return;
        if (dest.next == insert && insert != head) return;

        if (head == insert) head = insert.next;
        if (tail == dest) tail = insert;

        // Remove insert from where it was.
        insert.previous.next = insert.next;
        insert.next.previous = insert.previous;

        // Place insert after dest.
        insert.next = dest.next;
        dest.next.previous = insert;

        dest.next = insert;
        insert.previous = dest;
    }

    public E get(int index) {
        if (index < 0 || index >= count) throw new IndexOutOfBoundsException();
        return get(head, index).value;
    }

    public Node<E> getNode(int index) {
        if (index < 0 || index >= count) throw new IndexOutOfBoundsException();
        return get(head, index);
    }

    public Optional<Integer> getIndex(Node<E> node) {
        if (node == head) return Optional.of(0);

        var current = head.next;

        for (int i = 1; current != head; i++) {
            if (current == node) return Optional.of(i);
            current = current.next;
        }

        return Optional.empty();
    }

    public int size() {
        return count;
    }

    @Override
    public String toString() {
        if (head == null) return "Ring {}";

        var stringBuilder = new StringBuilder("Ring {");
        stringBuilder.append(head.value);

        var next = head.next;
        while (next != head) {
            stringBuilder.append(", ");
            stringBuilder.append(next.value);
            next = next.next;
        }

        return stringBuilder.append("}").toString();
    }



    public static <E> Node<E> get(Node<E> start, int jumps) {
        var next = start;
        for (int i = 0; i < jumps; i++) {
            next = next.next;
        }
        return next;
    }



    // Should an iterator be exposed instead?
    public static class Node<E> {

        private final E value;

        private Node<E> next;

        private Node<E> previous;



        private Node(E value) {
            this.value = value;
        }

    }

}
