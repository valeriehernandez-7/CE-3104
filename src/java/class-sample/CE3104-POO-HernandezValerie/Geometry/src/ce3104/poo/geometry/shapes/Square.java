package ce3104.poo.geometry.shapes;

public final class Square extends Shape {

    private final float side;

    public Square(float side) {
        this.side = side;
    }

    @Override
    public float getPerimeter() {
        return (4 * this.side);
    }

    @Override
    public float getArea() {
        return this.side * this.side;
    }
}
