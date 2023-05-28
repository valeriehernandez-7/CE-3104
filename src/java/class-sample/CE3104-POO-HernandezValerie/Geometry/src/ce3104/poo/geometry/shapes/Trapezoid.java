package ce3104.poo.geometry.shapes;

public final class Trapezoid extends Shape {

    private final Integer side;
    private final Integer smallBase;
    private final Integer largeBase;
    private final Integer height;

    public Trapezoid(Integer side, Integer smallBase, Integer largeBase, Integer height) {
        this.side = side;
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    public Trapezoid(Integer smallBase, Integer largeBase, Integer height) {
        this.side = (int) (Math.sqrt(Math.pow(height, 2) + Math.pow(((largeBase - smallBase) / 2), 2)));
        this.smallBase = smallBase;
        this.largeBase = largeBase;
        this.height = height;
    }

    @Override
    public Float getPerimeter() {
        return (float) ((2 * this.side) + this.smallBase + this.largeBase);
    }

    @Override
    public Float getArea() {
        return (float) ((this.height * (this.smallBase + this.largeBase)) / 2);
    }
}
