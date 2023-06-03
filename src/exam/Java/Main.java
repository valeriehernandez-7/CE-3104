import deportes.Baloncesto;
import deportes.Equipo;
import deportes.Futbol;
import deportes.Voleibol;

public class Main {
    public static void main(String[] args) {

        // arreglo de quipos deportivos
        Equipo[] equipos = {
                new Futbol(2, 3),
                new Baloncesto(5, 2),
                new Voleibol(6, 4)
        };

        // recorre los quipos mostrando su nombre, deporte y cantidad de persona en posicion
        for (Equipo e : equipos) {
            System.out.println("\n" + e.nombre);
            System.out.println("\tDeporte: " + e.deporte);
            System.out.print("\tPosiciones: ");
            e.listarPosiciones();
        }
    }
}