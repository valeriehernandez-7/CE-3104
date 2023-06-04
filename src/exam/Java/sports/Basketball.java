package sports;

/**
 * Clase Basketball que hereda de la superclase Team
 */
public final class Basketball extends Team {
    private final Integer wings; // cantidad de wings del equipo de baloncesto
    private final Integer posts; // cantidad de posts del equipo de baloncesto

    /**
     * Constructor por default de la clase Basketball
     *
     * @param wings cantidad de wings del equipo de baloncesto
     * @param posts cantidad de posts del equipo de baloncesto
     */
    public Basketball(Integer wings, Integer posts) {
        this.sport = this.getClass().getSimpleName();
        this.wings = wings;
        this.posts = posts;
    }

    @Override
    public void showPositions() {
        System.out.println("Wings : " + this.wings + ", Posts : " + this.posts);
    }
}
