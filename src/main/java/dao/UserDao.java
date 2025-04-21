package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDao {

	private String username;
	private String password;
	
	public String getUsername() {
		return this.username;
	}
	public String getPassword() {
		return this.password;
	}
	
	private UserDao(String name, String pass) {
		this.username = name;
		this.password = pass;
	}
	
	public static UserDao getUser(String un, String pwd) {
		Connection con = DbConnection.getDbConnection();
		
		PreparedStatement pst;
		UserDao userDao = null;
		
		String sql = "SELECT username, password "
						+ "FROM users WHERE username=?";
		
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, un);
			
			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next())
					userDao = new UserDao(rs.getString(1), rs.getString(2));
			}
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
//		finally {
//			try {con.close();}
//			catch(SQLException e) {System.out.print(e.getMessage());}
//		}
		return userDao;
	}
}
