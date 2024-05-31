import java.util.Random;
import java.util.Scanner;

public class Threads {

  public static void main(String args[]) {
    new RandomNumberGenerator().start();
    new Square().start();
    new Cube().start();
  }
}

class RandomNumberGenerator extends Thread {

  public void run() {
    Scanner scanner = new Scanner(System.in);
    Random random = new Random();
    System.out.print("Enter the iteration count for loop: ");
    int size = scanner.nextInt();

    for (int i = 0; i < size; i++) {
      int randomNumber = random.nextInt(100);

      if (randomNumber % 2 == 0) {
        Square.calculate(randomNumber);
      } else {
        Cube.calculate(randomNumber);
      }

      try {
        Thread.sleep(1000);
      } catch (Exception e) {
        System.out.println(e);
      }
    }
  }
}

class Square extends Thread {

  static void calculate(int number) {
    System.out.println("Square of " + number + " = " + number * number);
  }
}

class Cube extends Thread {

  static void calculate(int number) {
    System.out.println("Cube of " + number + " = " + number * number * number);
  }
}
