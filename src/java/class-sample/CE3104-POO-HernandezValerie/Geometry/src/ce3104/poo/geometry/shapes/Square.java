package ce3104.poo.geometry.shapes;

public final class Square extends Shape {

    private final Float side;

    public Square(Float side) {
        this.side = side;
    }

    @Override
    public Float getPerimeter() {
        return (4 * this.side);
    }

    @Override
    public Float getArea() {
        return this.side * this.side;
    }
}
