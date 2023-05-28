package ce3104.poo.geometry.shapes;

public final class Parallelogram extends Shape {

    private final Integer side;
    private final Integer base;
    private final Integer height;

    public Parallelogram(Integer side, Integer base, Integer height) {
        this.side = side;
        this.base = base;
        this.height = height;
    }

    @Override
    public Float getPerimeter() {
        return (float) (2 * (this.side + this.base));
    }

    @Override
    public Float getArea() {
        return (float) (this.base * this.height);
    }
}
