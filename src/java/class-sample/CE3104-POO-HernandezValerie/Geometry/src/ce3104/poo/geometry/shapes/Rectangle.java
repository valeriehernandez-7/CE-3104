package ce3104.poo.geometry.shapes;

public final class Rectangle extends Shape {

    private final Integer length;
    private final Integer width;

    public Rectangle(Integer length, Integer width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public Float getPerimeter() {
        return (float) (2 * (this.length + this.width));
    }

    @Override
    public Float getArea() {
        return (float) (this.length * this.width);
    }
}
