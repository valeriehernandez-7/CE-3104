package ce3104.poo.geometry.shapes;

/**
 * Abstract superclass of which shapes inherit common attributes and methods.
 */
public abstract class Shape {

    /**
     * Shape's name.
     */
    public final String name = this.getClass().getSimpleName();

    /**
     * Calculates the shape's perimeter based on its properties.
     * @return java.lang.Float as the shape's perimeter in meters
     */
    public abstract Float getPerimeter();

    /**
     * Calculates the shape's area based on its properties.
     * @return java.lang.Float as the shape's area in square meters
     */
    public abstract Float getArea();
}
