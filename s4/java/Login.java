import java.awt.*;
import java.awt.event.*;

class Login extends Frame implements ActionListener {

  Label outputLabel;
  TextField usernameField, passwordField;
  Button loginButton;

  Login() {
    setTitle("Login");
    setSize(300, 300);
    setLayout(null);

    Label usernameLabel = new Label("Username: ");
    add(usernameLabel);
    usernameLabel.setBounds(75,60,150,20);

    usernameField = new TextField();
    add(usernameField);
    usernameField.setBounds(75,90,150,20);

    Label passwordLabel = new Label("Password: ");
    add(passwordLabel);
    passwordLabel.setBounds(75,120,150,20);

    passwordField = new TextField();
    passwordField.setEchoChar('*');
    add(passwordField);
    passwordField.setBounds(75,150,150,20);

    loginButton = new Button("Login");
    add(loginButton);
    loginButton.addActionListener(this);
    loginButton.setBounds(75,180,150,30);

    outputLabel = new Label("");
    add(outputLabel);
    outputLabel.setBounds(75,220,150,20);

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

  public static void main(String args[]) {
    new Login();
  }
}