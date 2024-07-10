import java.util.Scanner;

abstract class Shape {

  int dimension1, dimension2;

  Shape(int dimension1, int dimension2) {
    this.dimension1 = dimension1;
    this.dimension2 = dimension2;
  }

  abstract void printArea();
}

class Rectangle extends Shape {

  Rectangle(int dimension1, int dimension2) {
    super(dimension1, dimension2);
  }

  void printArea() {
    System.out.println("Rectangle area = " + dimension1 * dimension2);
  }
}

class Triangle extends Shape {

  Triangle(int dimension1, int dimension2) {
    super(dimension1, dimension2);
  }

  void printArea() {
    System.out.println("Triangle area = " + dimension1 * dimension2 * 0.5);
  }
}

class Circle extends Shape {

  Circle(int dimension1) {
    super(dimension1, 0);
  }

  void printArea() {
    System.out.println("Circle area = " + dimension1 * dimension1 * Math.PI);
  }
}

public class AreaAbstract {

  public static void main(String args[]) {
    Scanner scanner = new Scanner(System.in);

    System.out.print("Enter length of rectangle: ");
    int l = scanner.nextInt();
    System.out.print("Enter width of rectangle: ");
    int w = scanner.nextInt();
    Rectangle rect = new Rectangle(l, w);
    rect.printArea();

    System.out.print("\nEnter base of triangle: ");
    int b = scanner.nextInt();
    System.out.print("Enter height of triangle: ");
    int h = scanner.nextInt();
    Triangle t = new Triangle(b, h);
    t.printArea();

    System.out.print("\nEnter radius of circle: ");
    int r = scanner.nextInt();
    Circle c = new Circle(r);
    c.printArea();
  }
}
