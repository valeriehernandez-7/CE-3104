package ce3104.poo.geometry.shapes;

/**
 * Square shape class extends from the Shape class
 * and implements the methods based on the properties of the square.
 */
public final class Square extends Shape {

    /**
     * Square class instance's side value in meters.
     */
    private final Float side;

    /**
     * Square's shape class default constructor.
     * @param side java.lang.Float as the square's side value in meters
     */
    public Square(Float side) {
        this.side = side;
    }

    @Override
    public Float getPerimeter() {
        return (4 * this.side);
    }

    @Override
    public Float getArea() {
        return this.side * this.side;
    }
}
