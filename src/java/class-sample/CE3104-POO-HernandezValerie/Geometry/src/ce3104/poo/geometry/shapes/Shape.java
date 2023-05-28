package ce3104.poo.geometry.shapes;

public abstract class Shape {

    public abstract float getPerimeter();

    public abstract float getArea();

    public String getName() {
        return this.getClass().getSimpleName();
    }
}
