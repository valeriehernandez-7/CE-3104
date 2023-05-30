package ce3104.poo.geometry.shapes;

/**
 * Circle shape class extends from the Shape class
 * and implements the methods based on the properties of the circle.
 */
public final class Circle extends Shape {

    /**
     * Circle class instance's radius value in meters.
     */
    private final Float radius;

    /**
     * Circle's shape class default constructor.
     * @param radius java.lang.Float as the circle's radius value in meters
     */
    public Circle(Float radius) {
        this.radius = radius;
    }

    @Override
    public Float getPerimeter() {
        return (float) (2 * Math.PI * this.radius);
    }

    @Override
    public Float getArea() {
        return (float) (Math.PI * Math.pow(this.radius, 2));
    }
}
