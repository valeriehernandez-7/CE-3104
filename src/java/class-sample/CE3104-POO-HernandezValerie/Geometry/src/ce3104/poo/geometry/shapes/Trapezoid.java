package ce3104.poo.geometry.shapes;

/**
 * Trapezoid shape class extends from the Shape class
 * and implements the methods based on the properties of the trapezoid.
 */
public final class Trapezoid extends Shape {

    /**
     * Trapezoid class instance's side value in meters.
     */
    private final Float side;

    /**
     * Trapezoid class instance's small base value in meters.
     */
    private final Float smallBase;

    /**
     * Trapezoid class instance's large base value in meters.
     */
    private final Float largeBase;

    /**
     * Trapezoid class instance's height value in meters.
     */
    private final Float height;

    /**
     * Trapezoid's shape class default constructor.
     * @param side      java.lang.Float as the trapezoid's side value in meters
     * @param smallBase java.lang.Float as the trapezoid's small base value in meters
     * @param largeBase java.lang.Float as the trapezoid's large base value in meters
     * @param height    java.lang.Float as the trapezoid's height value in meters
     */
    public Trapezoid(Float side, Float smallBase, Float largeBase, Float height) {
        this.side = side;
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    /**
     * Trapezoid's shape class custom constructor. This constructor doesn't receive
     * the value of the trapezoid's side, the constructor estimates it.
     * @param smallBase java.lang.Float as the trapezoid's small base value in meters
     * @param largeBase java.lang.Float as the trapezoid's large base value in meters
     * @param height    java.lang.Float as the trapezoid's height value in meters
     */
    public Trapezoid(Float smallBase, Float largeBase, Float height) {
        this.side = (float) (Math.sqrt(Math.pow(height, 2) + Math.pow(((largeBase - smallBase) / 2), 2)));
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    @Override
    public Float getPerimeter() {
        return ((2 * this.side) + this.smallBase + this.largeBase);
    }

    @Override
    public Float getArea() {
        return ((this.height * (this.smallBase + this.largeBase)) / 2);
    }
}
