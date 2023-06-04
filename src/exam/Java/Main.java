import sports.Team;
import sports.Soccer;
import sports.Basketball;
import sports.Volleyball;

public class Main {
    public static void main(String[] args) {

        // sport teams array
        Team[] teams = {
                new Soccer(2, 3),
                new Basketball(5, 2),
                new Volleyball(6, 4)
        };

        // recorre los quipos mostrando su nombre, deporte y cantidad de persona en posicion
        for (Team e : teams) {
            System.out.println("\n" + e.name);
            System.out.println("\tSport : " + e.sport);
            System.out.print("\tPositions : ");
            e.showPositions();
        }
    }
}