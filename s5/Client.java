
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import javax.swing.*;

public class Client implements ActionListener {

    JTextArea tArea = new JTextArea();
    JTextField tField = new JTextField(10);
    JLabel status = new JLabel("Waiting for server");
    PrintWriter out;
    BufferedReader in;

    void createGUI() {
        JFrame frame = new JFrame("Chat - Client");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 400);

        JPanel panel = new JPanel();
        JButton btnSend = new JButton("Send");
        btnSend.addActionListener(this);
        panel.add(new JLabel("Message"));
        panel.add(tField);
        panel.add(btnSend);

        frame.add(panel, BorderLayout.SOUTH);
        frame.add(new JLabel("Status: "), BorderLayout.NORTH);
        frame.add(status, BorderLayout.NORTH);
        frame.add(tArea, BorderLayout.CENTER);
        tArea.setEditable(false);
        frame.setVisible(true);
    }

    void connectToServer() {
        try {
            Socket socket = new Socket(InetAddress.getLocalHost(), 8000);
            out = new PrintWriter(socket.getOutputStream(), true);
            in = new BufferedReader(
                    new InputStreamReader(socket.getInputStream()));
            status.setText("Server Connected");
            while (true) {
                String str = in.readLine();
                tArea.append(str + "\n");
            }
        } catch (Exception exc) {
            System.out.println("No Server!");
        }
    }

    public void actionPerformed(ActionEvent event) {
        String message = tField.getText();
        out.println(message);
        tField.setText("");
    }

    public static void main(String[] args) {
        Client client = new Client();
        client.createGUI();
        client.connectToServer();
    }
}
