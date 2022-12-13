package utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Spliterator;
import java.util.Stack;
import java.util.function.Consumer;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

@SuppressWarnings("unused")
public class ManyLeafTree<T> implements Iterable<ManyLeafTree<T>> {

    private final ManyLeafTree<T> parent;
    
    private T data;

    private final ArrayList<ManyLeafTree<T>> children = new ArrayList<>();


    
    public ManyLeafTree(ManyLeafTree<T> parent, T data) {
        this.parent = parent;
        this.data = data;
    }



    public ManyLeafTree<T> getParent() {
        return parent;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public void addChild(ManyLeafTree<T> child) {
        children.add(child);
    }
    
    public void removeChild(int pos) {
        children.remove(pos);
    }

    public ArrayList<ManyLeafTree<T>> getChildren() {
        return children;
    }

    @Override
    public Iterator<ManyLeafTree<T>> iterator() {
        return new ManyLeafTreeIterator<>(this);
    }

    @Override
    public Spliterator<ManyLeafTree<T>> spliterator() {
        return new ManyLeafTreeSpliterator<>(this);
    }

    public Stream<ManyLeafTree<T>> stream() {
        return StreamSupport.stream(spliterator(), false);
    }


    
    private static class ManyLeafTreeIterator<T> implements Iterator<ManyLeafTree<T>> {
        private final Stack<ManyLeafTree<T>> waiting = new Stack<>();

        public ManyLeafTreeIterator(ManyLeafTree<T> start) {
            waiting.add(start);
        }

        @Override
        public boolean hasNext() {
            return !waiting.empty();
        }

        @Override
        public ManyLeafTree<T> next() {
            var current = waiting.pop();

            if (!current.getChildren().isEmpty()) {
                waiting.addAll(current.getChildren());
            }

            return current;
        }
    }

    private static class ManyLeafTreeSpliterator<T> implements Spliterator<ManyLeafTree<T>> {
        private final Iterator<ManyLeafTree<T>> itor;

        public ManyLeafTreeSpliterator(ManyLeafTree<T> tree) {
            itor = tree.iterator();
        }

        @Override
        public boolean tryAdvance(Consumer<? super ManyLeafTree<T>> action) {
            if (itor.hasNext()) {
                var next = itor.next();
                action.accept(next);
                return true;
            }

            return false;
        }

        @Override
        public Spliterator<ManyLeafTree<T>> trySplit() {
            if (itor.hasNext()) {
                var next = itor.next();
                return new ManyLeafTreeSpliterator<>(next);
            }

            return null;
        }

        @Override
        public long estimateSize() {
            return Long.MAX_VALUE;
        }

        @Override
        public int characteristics() {
            return DISTINCT | NONNULL;
        }
    }


}
