package ce3104.poo.geometry.shapes;

public final class Rectangle extends Shape {

    private final float length;
    private final float width;

    public Rectangle(float length, float width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public float getPerimeter() {
        return (2 * (this.length + this.width));
    }

    @Override
    public float getArea() {
        return (this.length * this.width);
    }
}
