import java.util.HashMap;
import java.util.Map;

class Darts {

    private final double x;
    private final double y;

    private Map<Integer, Integer> TargetCircleRadiiAndScores = new HashMap<>() {{
        // Outer.
        put(10, 1);
        // Middle.
        put(5, 5);
        // Inner.
        put(1, 10);
    }};

    Darts(double x, double y) {
        this.x = x;
        this.y = y;
    }

    int score() {
        Double distanceFromCenter = distanceFromCenter(this.x, this.y);

        for (Map.Entry<Integer, Integer> circle : TargetCircleRadiiAndScores.entrySet()) {
            Integer radius = circle.getKey();
            Integer score = circle.getValue();

            if (distanceFromCenter <= radius) {
                return score;
            }
        }

        return 0;
    }

    private double distanceFromCenter(double x, double y) {
        double ac = Math.abs(0 - y);
        double cb = Math.abs(0 - x);

        return Math.hypot(ac, cb);
    }

}
