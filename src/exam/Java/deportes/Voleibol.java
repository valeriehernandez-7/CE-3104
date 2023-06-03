package ce3104.exam.java.deportes;

/**
 * Clase Voleibol que hereda de la superclase Equipo
 */
public final class Voleibol extends Equipo {
    private final Integer rematadores; // cantidad de rematadores del equipo de voleibol
    private final Integer distribuidores; // cantidad de distribuidores del equipo de voleibol

    /**
     * Constructor por default de la clase Voleibol
     * @param rematadores
     * @param distribuidores
     */
    public Voleibol (Integer rematadores, Integer distribuidores) {
        this.deporte = this.getClass().getSimpleName();
        this.rematadores = rematadores;
        this.distribuidores = distribuidores;
    }

    @Override
    public void listarPosiciones() {
        System.out.println("Rematadores : " + this.rematadores + ", Distribuidores : " + this.distribuidores);
    }
}
