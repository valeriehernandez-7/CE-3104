package shapes;

/**
 * Rectangle shape class extends from the Shape class
 * and implements the methods based on the properties of the rectangle.
 */
public final class Rectangle extends Shape {

    /**
     * Rectangle class instance's length value in meters.
     */
    private final Float length;

    /**
     * Rectangle class instance's width value in meters.
     */
    private final Float width;

    /**
     * Rectangle's shape class default constructor.
     * @param length java.lang.Float as the rectangle's length value in meters
     * @param width  java.lang.Float as the rectangle's width value in meters
     */
    public Rectangle(Float length, Float width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public Float getPerimeter() {
        return (2 * (this.length + this.width));
    }

    @Override
    public Float getArea() {
        return (this.length * this.width);
    }
}
