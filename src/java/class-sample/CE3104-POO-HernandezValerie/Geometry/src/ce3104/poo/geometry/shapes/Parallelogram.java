package ce3104.poo.geometry.shapes;

/**
 * Parallelogram shape class extends from the Shape class
 * and implements the methods based on the properties of the parallelogram.
 */
public final class Parallelogram extends Shape {

    /**
     * Parallelogram class instance's side value in meters.
     */
    private final Float side;

    /**
     * Parallelogram class instance's base value in meters.
     */
    private final Float base;

    /**
     * Parallelogram class instance's height value in meters.
     */
    private final Float height;

    /**
     * Parallelogram's shape class default constructor.
     * @param side   java.lang.Float as the parallelogram's side value in meters
     * @param base   java.lang.Float as the parallelogram's base value in meters
     * @param height java.lang.Float as the parallelogram's height value in meters
     */
    public Parallelogram(Float side, Float base, Float height) {
        this.side = side;
        this.base = base;
        this.height = height;
    }

    @Override
    public Float getPerimeter() {
        return (2 * (this.side + this.base));
    }

    @Override
    public Float getArea() {
        return (this.base * this.height);
    }
}
