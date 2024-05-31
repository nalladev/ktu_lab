import java.awt.*;
import java.awt.event.*;

public class Division extends Frame implements ActionListener {

  Label errorLabel;
  TextField num1Field, num2Field, resultField;

  public Division() {
    setTitle("Integer Division");
    setSize(300, 300);
    setLayout(null);

    Label num1Label = new Label("Num1:");
    add(num1Label);
    num1Label.setBounds(75, 50, 50, 20);

    num1Field = new TextField();
    add(num1Field);
    num1Field.setBounds(125, 50, 100, 20);

    Label num2Label = new Label("Num2:");
    add(num2Label);
    num2Label.setBounds(75, 80, 50, 20);

    num2Field = new TextField();
    add(num2Field);
    num2Field.setBounds(125, 80, 100, 20);

    Button divideButton = new Button("Divide");
    divideButton.addActionListener(this);
    add(divideButton);
    divideButton.setBounds(75, 120, 150, 30);

    Label resultLabel = new Label("Result:");
    add(resultLabel);
    resultLabel.setBounds(75, 170, 50, 20);

    resultField = new TextField();
    add(resultField);
    resultField.setBounds(125, 170, 100, 20);
    resultField.setEditable(false);

    errorLabel = new Label("");
    add(errorLabel);
    errorLabel.setBounds(75, 200, 150, 20);

    setVisible(true);
  }

  public void actionPerformed(ActionEvent e) {
    resultField.setText("");
    errorLabel.setText("");
    try {
      int num1 = Integer.parseInt(num1Field.getText());
      int num2 = Integer.parseInt(num2Field.getText());

      int result = num1 / num2;

      resultField.setText(String.valueOf(result));
    } catch (NumberFormatException ex) {
      errorLabel.setText("NumberFormatException");
    } catch (ArithmeticException ex) {
      errorLabel.setText("ArithmeticException");
    }
  }

  public static void main(String args[]) {
    new Division();
  }
}