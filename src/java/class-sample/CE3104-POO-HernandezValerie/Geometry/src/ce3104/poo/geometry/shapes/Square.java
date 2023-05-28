package ce3104.poo.geometry.shapes;

public final class Square extends Shape {

    private final Integer side;

    public Square(Integer side) {
        this.side = side;
    }

    @Override
    public Float getPerimeter() {
        return (float) (4 * this.side);
    }

    @Override
    public Float getArea() {
        return (float) (this.side * this.side);
    }
}
