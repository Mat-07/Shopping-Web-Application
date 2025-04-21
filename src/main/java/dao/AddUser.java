package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddUser {
	
	
	public static void addUserToDb(String username, String firstName, String lastName,
									String email, String gender, String password) {
		Connection con = DbConnection.getDbConnection();
		PreparedStatement pst = null;
		
		String sql = "INSERT INTO users"
					+ "(username, password, first_name , last_name, email_id, gender)"
					+ "VALUES"
					+ "(?, ?, ?, ?, ?, ?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, firstName);
			pst.setString(4, lastName);
			pst.setString(5,email);
			pst.setString(6,gender);
			
			int row = pst.executeUpdate();
			System.out.println(row + " updated");
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
