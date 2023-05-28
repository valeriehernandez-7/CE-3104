package ce3104.poo.geometry.shapes;

public final class Trapezoid extends Shape {

    private final float side;
    private final float smallBase;
    private final float largeBase;
    private final float height;

    public Trapezoid(float side, float smallBase, float largeBase, float height) {
        this.side = side;
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    public Trapezoid(float smallBase, float largeBase, float height) {
        this.side = (float) (Math.sqrt(Math.pow(height, 2) + Math.pow(((largeBase - smallBase) / 2), 2)));
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    @Override
    public float getPerimeter() {
        return ((2 * this.side) + this.smallBase + this.largeBase);
    }

    @Override
    public float getArea() {
        return ((this.height * (this.smallBase + this.largeBase)) / 2);
    }
}
