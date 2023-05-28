package ce3104.poo.geometry.shapes;

public final class Parallelogram extends Shape {

    private final Float side;
    private final Float base;
    private final Float height;

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
