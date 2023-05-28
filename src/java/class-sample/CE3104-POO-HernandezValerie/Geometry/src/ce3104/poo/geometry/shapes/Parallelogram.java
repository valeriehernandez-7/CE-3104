package ce3104.poo.geometry.shapes;

public final class Parallelogram extends Shape {

    private final float side;
    private final float base;
    private final float height;

    public Parallelogram(float side, float base, float height) {
        this.side = side;
        this.base = base;
        this.height = height;
    }

    @Override
    public float getPerimeter() {
        return (2 * (this.side + this.base));
    }

    @Override
    public float getArea() {
        return (this.base * this.height);
    }
}
