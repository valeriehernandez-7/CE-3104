package ce3104.poo.geometry;

import ce3104.poo.geometry.shapes.*;

public class Main {
    public static void main(String[] args) {

        Shape[] shapes = {
                new Circle(5F),
                new Square(6F),
                new Rectangle(10F, 5F),
                new Trapezoid(3F, 10F, 5F),
                new Parallelogram(13F, 20F, 12F)
        };

        for (Shape shape : shapes) {
            System.out.println("\n" + shape.name);
            System.out.println("\tPerimeter ≈ " + shape.getPerimeter() + " m");
            System.out.println("\tArea ≈ " + shape.getArea() + " m²");
        }
    }
}