package days.d1_d10;

import utils.GenericDay;
import utils.ReadLines;
import utils.RunType;

import java.io.File;
import java.util.HashSet;

public class Day3Part2 implements GenericDay {

    private int answer = 0;

    private int partyMember = 0;

    private HashSet<Character> bag1 = new HashSet<>();

    private HashSet<Character> bag2 = new HashSet<>();



    public Day3Part2(RunType runType) {
        File inputFile = getFile(runType, 3);

        doTheThing(inputFile);
    }



    private void doTheThing(File inputFile) {
        var lineEater = new ReadLines(inputFile, this::eatLine);
        lineEater.readFile();
    }

    private void eatLine(String line) {
        switch (partyMember) {
            case 0 -> partyMember1(line);
            case 1 -> partyMember2(line);
            case 2 -> partyMember3(line);
            default -> throw new IllegalStateException("There are 3 members of a part and the party member count is 4.");
        }
    }

    private void partyMember1(String bag1) {
        this.bag1 = new HashSet<>();
        for (Character c : bag1.toCharArray()) this.bag1.add(c);
        partyMember++;
    }

    private void partyMember2(String bag2) {
        this.bag2 = new HashSet<>();
        for (Character c : bag2.toCharArray()) {
            if (bag1.contains(c)) {
                this.bag2.add(c);
            }
        }
        partyMember++;
    }

    private void partyMember3(String bag3) {
        for (Character c : bag3.toCharArray()) {
            if (bag2.contains(c)) {
                answer += Day3Common.getItemPriority(c);
                partyMember = 0;
                return;
            }
        }

        throw new IllegalStateException("Failed to find the common item.");
    }



    public int getAnswer() {
        return answer;
    }



    public static void main(String[] args) {
        var day = new Day3Part2(RunType.Q);
        System.out.println(day.answer);
    }

}
