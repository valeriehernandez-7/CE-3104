package ce3104.poo.geometry;

import ce3104.poo.geometry.shapes.*;

/*
    Valerie M. Hernández Fernández
    valeriehernandez@estudiantec.cr
    https://github.com/valeriehernandez-7

    Programación Orientada a Objetos
    Taller (Quiz)

    Instituto Tecnológico de Costa Rica
    Campus Tecnológico Central Cartago
    Área Académica Ingeniería en Computadores

    CE 3104 Lenguajes, Compiladores e Intérpretes
    Ing. Marco Rivera Meneses, MGP
    Grupo 01

    I Semestre
    2023
 */

public class Main {
    public static void main(String[] args) {

        // array of 5 different shapes
        Shape[] shapes = {
                new Circle(5F),
                new Square(6F),
                new Rectangle(10F, 5F),
                new Trapezoid(3F, 10F, 5F),
                new Parallelogram(13F, 20F, 12F)
        };

        // loops through the array of shapes and prints their name, perimeter and area
        for (Shape shape : shapes) {
            System.out.println("\n" + shape.name);
            System.out.println("\tPerimeter ≈ " + shape.getPerimeter() + " m");
            System.out.println("\tArea ≈ " + shape.getArea() + " m²");
        }
    }
}