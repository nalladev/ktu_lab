import java.awt.*;
import java.awt.event.*;

public class Division extends Frame implements ActionListener {

  private TextField num1Field, num2Field, resultField;
  private Label errorLabel;

  public Division() {
    setTitle("Integer Division");
    setSize(300, 150);
    setLayout(new GridLayout(4, 2, 10, 10));

    Label num1Label = new Label("Num1:");
    add(num1Label);

    num1Field = new TextField(10);
    add(num1Field);

    Label num2Label = new Label("Num2:");
    add(num2Label);

    num2Field = new TextField(10);
    add(num2Field);

    Button divideButton = new Button("Divide");
    divideButton.addActionListener(this);
    add(divideButton);

    Label resultLabel = new Label("Result:");
    add(resultLabel);

    resultField = new TextField(10);
    resultField.setEditable(false);
    add(resultField);

    errorLabel = new Label("");
    add(errorLabel);

    setVisible(true);
  }

  public void actionPerformed(ActionEvent e) {
    try {
      int num1 = Integer.parseInt(num1Field.getText());
      int num2 = Integer.parseInt(num2Field.getText());

      int result = num1 / num2;
      resultField.setText(String.valueOf(result));

      errorLabel.setText("");
    } catch (NumberFormatException ex) {
      errorLabel.setText("NumberFormatException");
    } catch (ArithmeticException ex) {
      errorLabel.setText("ArithmeticException");
    }
  }

  public static void main(String[] args) {
    new Division();
  }
}
