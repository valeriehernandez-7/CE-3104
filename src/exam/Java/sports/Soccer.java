package sports;

/**
 * Clase Soccer que hereda de la superclase Team
 */
public final class Soccer extends Team {
    private final Integer goalkeepers; // cantidad de goalkeepers del equipo de futbol
    private final Integer defenders; // cantidad de defenders del equipo de futbol

    /**
     * Constructor por default de la clase Soccer
     *
     * @param goalkeepers cantidad de goalkeepers del equipo de futbol
     * @param defenders cantidad de defenders del equipo de futbol
     */
    public Soccer(Integer goalkeepers, Integer defenders) {
        this.sport = this.getClass().getSimpleName();
        this.goalkeepers = goalkeepers;
        this.defenders = defenders;
    }

    @Override
    public void showPositions() {
        System.out.println("Goalkeepers : " + this.goalkeepers + ", Defenders : " + this.defenders);
    }
}