import java.util.Scanner;

class Person {

  String name, gender;
  int age;

  void displayDetails() {
    System.out.println("Name: " + name);
    System.out.println("Gender: " + gender);
    System.out.println("Age: " + age);
  }

  void getDetails() {
    Scanner scanner = new Scanner(System.in);
    System.out.print("Name: ");
    this.name = scanner.nextLine();
    System.out.print("Gender: ");
    this.gender = scanner.nextLine();
    System.out.print("Age: ");
    this.age = scanner.nextInt();
  }
}

class Professor extends Person {

  String type = "Professor";

  void displayDetails() {
    super.displayDetails();
    System.out.println("Type: " + type);
  }
}

class AssistantProfessor extends Person {

  String type = "Assistant Professor";

  void displayDetails() {
    super.displayDetails();
    System.out.println("Type: " + type);
  }
}

class AssociateProfessor extends Person {

  String type = "Associate Professor";

  void displayDetails() {
    super.displayDetails();
    System.out.println("Type: " + type);
  }
}

public class EmployeeDB {

  public static void main(String args[]) {
    Professor[] p = new Professor[5];
    AssistantProfessor[] asp = new AssistantProfessor[5];
    AssociateProfessor[] acp = new AssociateProfessor[5];

    System.out.println("\nEnter Professors Details");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Enter details of Professor " + count);
      p[i] = new Professor();
      p[i].getDetails();
    }

    System.out.println("\nEnter Assistant Professors Details");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Enter details of Assistant Professor " + count);
      asp[i] = new AssistantProfessor();
      asp[i].getDetails();
    }

    System.out.println("\nEnter Associate Professors Details");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Enter details of Associate Professor " + count);
      acp[i] = new AssociateProfessor();
      acp[i].getDetails();
    }

    System.out.println("\nProfessors Data: ");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Professor: " + count);
      p[i].displayDetails();
    }

    System.out.println("\nAssistant Professors Data: ");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Assistant Professor: " + count);
      asp[i].displayDetails();
    }

    System.out.println("\nAssociate Professors Data: ");
    for (int i = 0; i < 5; i++) {
      int count = i + 1;
      System.out.println("Associate Professor: " + count);
      acp[i].displayDetails();
    }
  }
}
