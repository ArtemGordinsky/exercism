import java.util.Comparator;
import java.util.Random;
import java.util.stream.IntStream;

class DnDCharacter {

    private final int constitution;
    private final int strength;
    private final int dexterity;
    private final int intelligence;
    private final int wisdom;
    private final int charisma;
    private final int hitpoints;

    private static final Random rand = new Random();

    public DnDCharacter() {
        constitution = ability();
        strength = ability();
        dexterity = ability();
        intelligence = ability();
        wisdom = ability();
        charisma = ability();
        hitpoints = 10 + modifier(constitution);
    }

    public int ability() {
        return IntStream.of(rand.nextInt(6), rand.nextInt(6), rand.nextInt(6), rand.nextInt(6))
            .boxed()
            .sorted(Comparator.reverseOrder())
            .mapToInt(i -> i + 1)
            .limit(3)
            .sum();
    }

    public int modifier(int input) {
        return (int) Math.floor(((double) input - 10) / 2);
    }

    public int getConstitution() {
        return constitution;
    }

    public int getHitpoints() {
        return hitpoints;
    }

    public int getStrength() {
        return strength;
    }

    public int getDexterity() {
        return dexterity;
    }

    public int getIntelligence() {
        return intelligence;
    }

    public int getWisdom() {
        return wisdom;
    }

    public int getCharisma() {
        return charisma;
    }
}
