package ce3104.poo.geometry.shapes;

public final class Circle extends Shape {

    private final float radius;

    public Circle(float radius) {
        this.radius = radius;
    }

    @Override
    public float getPerimeter() {
        return (float) (2 * Math.PI * this.radius);
    }

    @Override
    public float getArea() {
        return (float) (Math.PI * Math.pow(this.radius, 2));
    }
}
