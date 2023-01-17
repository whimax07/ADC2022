package utils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Set;

@SuppressWarnings("unused")
public class Counter<T> {

    private final HashMap<T, Integer> map = new HashMap<>();

    private int countTotal = 0;



    public void add(T key) {
        countTotal++;
        map.put(key, map.getOrDefault(key, 0) + 1);
    }

    public int count(T key) {
       return map.getOrDefault(key, 0);
    }

    public int countTotal() {
        return countTotal;
    }

    public Set<T> keySet() {
        return map.keySet();
    }

    public Collection<Integer> counts() {
        return map.values();
    }

}
