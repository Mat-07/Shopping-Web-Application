package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

public class AdminValidator {
	
	
	public static boolean validateAdmin (HttpServletRequest req, int id, String password) {
		Connection con = DbConnection.getDbConnection();
		String sql = "SELECT *"
					+ "FROM admin "
					+ "WHERE admin_id=" + id 
					+ " AND password=\"" + password + "\";";
		try {
			
			Statement st = con.createStatement();
			try (ResultSet rs = st.executeQuery(sql)) {
				if (!rs.next()) {
					return false;
				}
			}
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
}
