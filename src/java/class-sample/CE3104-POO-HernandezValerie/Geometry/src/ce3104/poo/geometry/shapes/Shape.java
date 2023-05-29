package ce3104.poo.geometry.shapes;

public abstract class Shape {

    public final String name = this.getClass().getSimpleName();

    public abstract Float getPerimeter();

    public abstract Float getArea();
}
