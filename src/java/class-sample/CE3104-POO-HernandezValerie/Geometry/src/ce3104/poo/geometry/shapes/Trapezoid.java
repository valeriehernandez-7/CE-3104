package ce3104.poo.geometry.shapes;

public final class Trapezoid extends Shape {

    private final Float side;
    private final Float smallBase;
    private final Float largeBase;
    private final Float height;

    public Trapezoid(Float side, Float smallBase, Float largeBase, Float height) {
        this.side = side;
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

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
