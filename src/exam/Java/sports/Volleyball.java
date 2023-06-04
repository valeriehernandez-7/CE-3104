package sports;

/**
 * Clase Volleyball que hereda de la superclase Team
 */
public final class Volleyball extends Team {
    private final Integer hitters; // cantidad de hitters del equipo de voleibol
    private final Integer setters; // cantidad de setters del equipo de voleibol

    /**
     * Constructor por default de la clase Volleyball
     * @param hitters
     * @param setters
     */
    public Volleyball(Integer hitters, Integer setters) {
        this.sport = this.getClass().getSimpleName();
        this.hitters = hitters;
        this.setters = setters;
    }

    @Override
    public void showPositions() {
        System.out.println("Hitters : " + this.hitters + ", Setters : " + this.setters);
    }
}
