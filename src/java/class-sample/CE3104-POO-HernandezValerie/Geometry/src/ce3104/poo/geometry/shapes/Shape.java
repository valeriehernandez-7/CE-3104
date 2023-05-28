package ce3104.poo.geometry.shapes;

public abstract class Shape {

    public abstract Float getPerimeter();

    public abstract Float getArea();

    public String getName() {
        return this.getClass().getSimpleName();
    }
}
