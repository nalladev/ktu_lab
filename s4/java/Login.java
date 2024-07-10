import java.awt.*;
import java.awt.event.*;

class Login extends Frame implements ActionListener {

  TextField usernameField, passwordField;
  Label outputLabel;

  Login() {
    setTitle("Login");
    setSize(300, 150);
    setLayout(new GridLayout(4, 2, 10, 10));

    add(new Label("Username: "));
    usernameField = new TextField();
    add(usernameField);

    add(new Label("Password: "));
    passwordField = new TextField();
    passwordField.setEchoChar('*');
    add(passwordField);

    Button loginButton = new Button("Login");
    add(loginButton);
    loginButton.addActionListener(this);

    outputLabel = new Label("");
    add(outputLabel);

    setVisible(true);
  }

  public void actionPerformed(ActionEvent e) {
    String username = usernameField.getText();
    String password = passwordField.getText();

    if (username.equals("admin") && password.equals("admin")) {
      outputLabel.setText("Login successful!");
    } else {
      outputLabel.setText("Invalid credentials!");
    }
  }

  public static void main(String[] args) {
    new Login();
  }
}
