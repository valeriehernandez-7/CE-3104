package sports;

/**
 * Superclase Team
 */
public class Team {
    public String name; // name del equipo deportivo
    public String sport; // name del sport que practica el equipo

    /**
     * Constructor por default de la superclase Team
     */
    public Team() {
        this.name = "Saprissa";
        this.sport = "Soccer";
    }

    /**
     * Constructor de la superclase Team
     *
     * @param name  name del equipo deportivo
     * @param sport name del sport que practica el equipo
     */
    public Team(String name, String sport) {
        this.name = name;
        this.sport = sport;
    }

    /**
     * Lista las cantidad de personas en las posiciones del equipo
     */
    public void showPositions() {
        System.out.println("Goalkeepers : 1 , Defenders : 4");
    }
}
