package ce3104.exam.java.deportes;

/**
 * Clase Baloncesto que hereda de la superclase Equipo
 */
public final class Baloncesto extends Equipo {
    private final Integer aleros; // cantidad de aleros del equipo de baloncesto
    private final Integer postes; // cantidad de postes del equipo de baloncesto

    /**
     * Constructor por default de la clase Baloncesto
     *
     * @param aleros cantidad de aleros del equipo de baloncesto
     * @param postes cantidad de postes del equipo de baloncesto
     */
    public Baloncesto(Integer aleros, Integer postes) {
        this.deporte = this.getClass().getSimpleName();
        this.aleros = aleros;
        this.postes = postes;
    }

    @Override
    public void listarPosiciones() {
        System.out.println("Aleros : " + this.aleros + ", Postes : " + this.postes);
    }
}
