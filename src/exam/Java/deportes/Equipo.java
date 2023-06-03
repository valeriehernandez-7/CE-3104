package ce3104.exam.java.deportes;

/**
 * Superclase Equipo
 */
public class Equipo {
    public String nombre; // nombre del equipo deportivo
    public String deporte; // nombre del deporte que practica el equipo

    /**
     * Constructor por default de la superclase Equipo
     */
    public Equipo() {
        this.nombre = "Saprissa";
        this.deporte = "Futbol";
    }

    /**
     * Constructor de la superclase Equipo
     *
     * @param nombre  nombre del equipo deportivo
     * @param deporte nombre del deporte que practica el equipo
     */
    public Equipo(String nombre, String deporte) {
        this.nombre = nombre;
        this.deporte = deporte;
    }

    /**
     * Lista las cantidad de personas en las posiciones del equipo
     */
    public void listarPosiciones() {
        System.out.println("Porteros : 1 , Defensas : 4");
    }
}
