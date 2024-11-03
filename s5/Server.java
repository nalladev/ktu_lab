
import java.io.*;
import java.net.*;

public class Server implements Runnable {

    PrintWriter out[] = new PrintWriter[10];
    BufferedReader in[] = new BufferedReader[10];
    int clients, temp;

    void acceptClients() {
        try {
            clients = 0;
            System.out.println("Waiting for clients.");
            ServerSocket serverSocket = new ServerSocket(8000);
            Socket socket[] = new Socket[10];
            while (true) {
                socket[clients] = serverSocket.accept();
                System.out.println("New Client " + clients);
                out[clients] = new PrintWriter(socket[clients].getOutputStream(), true);
                in[clients] = new BufferedReader(
                        new InputStreamReader(socket[clients].getInputStream()));
                Thread thread = new Thread(this);
                temp = clients;
                thread.start();
                clients++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String args[]) {
        Server server = new Server();
        server.acceptClients();
    }

    public void run() {
        int clientId = temp;
        while (true) {
            try {
                String str = in[clientId].readLine();
                for (int i = 0; i < clients; i++) {
                    String n = (i == clientId) ? "Me: " : "Client " + clientId + ": ";
                    out[i].println(n + str);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

}
