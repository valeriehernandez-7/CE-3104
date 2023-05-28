package ce3104.poo.geometry.shapes;

public final class Circle extends Shape {

    private final Integer radius;

    public Circle(Integer radius) {
        this.radius = radius;
    }

    @Override
    public Float getPerimeter() {
        return (float) (2 * Math.PI * this.radius);
    }

    @Override
    public Float getArea() {
        return (float) (Math.PI * Math.pow(this.radius, 2));
    }
}
