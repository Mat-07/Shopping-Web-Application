package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    // Method to establish the database connection
    public static Connection getDbConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/shop"; // Database URL
        String dbUsername = "root"; // Database username
        String dbPassword = "Tiger"; // Database password

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection
            con = DriverManager.getConnection(url, dbUsername, dbPassword);
            System.out.println("Database connected successfully.");
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database. Please check your credentials or database URL.");
            e.printStackTrace(); // Log detailed SQL exception stack trace
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found. Make sure the MySQL driver JAR is added to your project.");
            e.printStackTrace(); // Log detailed class loading exception
        }
        
        return con; // Return the connection object
    }
    
    public static void main(String[] args) {
        // Test the connection
        Connection connection = getDbConnection();
        if (connection != null) {
            System.out.println("Connection object: " + connection);
        } else {
            System.out.println("Connection failed.");
        }
    }
}

