package ce3104.poo.geometry;

import ce3104.poo.geometry.shapes.*;

public class Main {
    public static void main(String[] args) {

        Shape[] shapes = {
                new Circle(5),
                new Square(6),
                new Rectangle(10, 5),
                new Trapezoid(3, 10, 5),
                new Parallelogram(13, 20, 12)
        };

        for (Shape shape : shapes) {
            System.out.println("\n" + shape.getName());
            System.out.println("\tPerimeter ≈ " + shape.getPerimeter() + " m");
            System.out.println("\tArea ≈ " + shape.getArea() + " m²");
        }
    }
}