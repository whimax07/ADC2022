package days;

public class Day3Common {

    public static int getItemPriority(Character c) {
        int value;

        if (Character.isUpperCase(c)) {
            value = 27 + c - 'A';
        } else {
            value = 1 + c - 'a';
        }

        return value;
    }

}
