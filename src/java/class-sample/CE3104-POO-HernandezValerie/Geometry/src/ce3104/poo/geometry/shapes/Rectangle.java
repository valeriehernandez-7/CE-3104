package ce3104.poo.geometry.shapes;

public final class Rectangle extends Shape {

    private final Float length;
    private final Float width;

    public Rectangle(Float length, Float width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public Float getPerimeter() {
        return (2 * (this.length + this.width));
    }

    @Override
    public Float getArea() {
        return (this.length * this.width);
    }
}
