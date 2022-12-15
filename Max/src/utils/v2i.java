package utils;

public record v2i(int x, int y) {

    public static v2i add(v2i left, v2i right) {
        return new v2i(left.x() + right.x(), left.y() + right.y());
    }

    public static v2i subtract(v2i left, v2i right) {
        return new v2i(left.x() - right.x(), left.y() - right.y());
    }

}
