import java.util.Scanner;

public class StackException {

  int size, top;
  int[] array;

  StackException(int s) {
    size = s;
    array = new int[size];
    top = -1;
  }

  void push(int value) {
    try {
      if (top < (size - 1)) {
        array[++top] = value;
        System.out.println(value + " Pushed to stack.");
      } else {
        throw new StackOverflowException();
      }
    } catch (StackOverflowException e) {
      System.out.println(e);
    }
  }

  int pop() {
    int value = -1;
    try {
      if (top > -1) {
        value = array[top--];
        System.out.println(value + " Poped from stack.");
      } else {
        throw new StackUnderflowException();
      }
    } catch (StackUnderflowException e) {
      System.out.println(e);
    }
    return value;
  }

  void display() {
    if (top == -1) {
      System.out.println("Stack is empty.");
    } else {
      System.out.println("Stack elements:");
      for (int i = top; i >= 0; i--) {
        System.out.println(array[i]);
      }
    }
  }

  public static void main(String args[]) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Enter stack size: ");
    int s = scanner.nextInt();
    StackException stack = new StackException(s);
    System.out.print("Stack created with size " + s);

    boolean exit = false;
    while (!exit) {
      System.out.println();
      System.out.println("Select operation:");
      System.out.println("1. Push");
      System.out.println("2. Pop");
      System.out.println("3. Display stack");
      System.out.println("4. Exit");

      System.out.print("Enter choice: ");
      int choice = scanner.nextInt();
      switch (choice) {
        case 1:
          System.out.print("Enter value to push: ");
          stack.push(scanner.nextInt());
          break;
        case 2:
          stack.pop();
          break;
        case 3:
          stack.display();
          break;
        case 4:
          exit = true;
          break;
        default:
          System.out.println("Invalid choice. Please select a valid option.");
      }
    }
  }
}
class StackOverflowException extends Exception {}
class StackUnderflowException extends Exception {}
