package ce3104.exam.java.deportes;

/**
 * Clase Futbol que hereda de la superclase Equipo
 */
public final class Futbol extends Equipo {
    private final Integer porteros; // cantidad de porteros del equipo de futbol
    private final Integer defensas; // cantidad de defensas del equipo de futbol

    /**
     * Constructor por default de la clase Futbol
     *
     * @param porteros cantidad de porteros del equipo de futbol
     * @param defensas cantidad de defensas del equipo de futbol
     */
    public Futbol(Integer porteros, Integer defensas) {
        this.deporte = this.getClass().getSimpleName();
        this.porteros = porteros;
        this.defensas = defensas;
    }

    @Override
    public void listarPosiciones() {
        System.out.println("Porteros : " + this.porteros + ", Defensas : " + this.defensas);
    }
}