package dao;

import java.awt.Taskbar.State;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
	
	public static Product getProductById(int id) {
		
		Connection con = DbConnection.getDbConnection();
		String sql = "SELECT * FROM products WHERE prod_id=?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id);
			
			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) {
					Product product = new Product(
							rs.getInt(1),
							rs.getString(2),
							rs.getDouble(3),
							rs.getInt(4),
							rs.getString(5),
							getCategoryId(rs.getInt(6)),
							rs.getString(7)
							);
					return product;
				}
			}
			return null;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
		finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
    			System.out.println(e.getMessage());

                e.printStackTrace();
            }
        }
		
	}
	
	public static void removeProduct (int id) {
		
		Connection con = DbConnection.getDbConnection();
		
		String sql = "DELETE FROM products WHERE prod_id=?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id);
			pst.executeUpdate();
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	public static List<Product> getProducts (String category) {
		
		
		int cat_id = getCategoryName(category);
		Connection con = DbConnection.getDbConnection();
		String sql;
		if (category.equals("all"))
			sql = "SELECT * FROM products";
		else
			sql = "SELECT * FROM products WHERE prod_category_id=" + cat_id;
		
		List<Product> products = new ArrayList<>();
		
		try (Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(sql)) {
			
			while (rs.next()) {
				Product product = new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getInt(4),
						rs.getString(5),
						getCategoryId(rs.getInt(6)),
						rs.getString(7)
						);
				products.add(product);
			}
			System.out.println("inside prod");
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return products;
	}
	
	private static String getCategoryId (int id) {
		Connection con = DbConnection.getDbConnection();
		String sql = "SELECT category_name FROM categories WHERE id = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setInt(1, id);
			try (ResultSet rs = pst.executeQuery()) {
				rs.next();
				String cat = rs.getString(1);
				return cat;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	private static int getCategoryName (String name) {
		Connection con = DbConnection.getDbConnection();
		String sql = "SELECT id FROM categories WHERE category_name = ?";
		
		try (PreparedStatement pst = con.prepareStatement(sql)) {
			pst.setString(1, name);
			try (ResultSet rs = pst.executeQuery()) {
				rs.next();
				int id = rs.getInt(1);
				return id;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return -1;
	}
	
	
	
	public static boolean addProduct (String name, int qty, double price, 
										String category, String desc, String url) {
		
		System.out.println(name);
		System.out.println(qty);
		System.out.println(price);
		System.out.println(category);
		System.out.println(desc);
		System.out.println(url);
		
		Connection con = DbConnection.getDbConnection();
		
		String sql1 = "SELECT id FROM Categories WHERE category_name =?;";
		int catId = -1;
		try {
			PreparedStatement pst = con.prepareStatement(sql1);
			pst.setString(1, category);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				catId = rs.getInt(1);
			else
				return false;
			if (pst != null) pst.close();
			if (rs != null) rs.close();
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			return false;
		}
		
		
		String sql = "INSERT INTO products (prod_name, prod_price, prod_qty, prod_img_url, prod_category_id, prod_desc) VALUES (?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setDouble(2, price);
			pst.setInt(3, qty);
			pst.setString(4, url);
			pst.setInt(5, catId);
			pst.setString(6, desc);
			pst.executeUpdate();
			if (pst != null) pst.close();
			
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
		finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
    			System.out.println(e.getMessage());

                e.printStackTrace();
            }
        }
		
		return true;
	}

	public static void updateProduct(int id, String name, double price, int qty, String desc) {
		// TODO Auto-generated method stub
		
		String sql = "UPDATE products SET prod_name = ?, prod_price = ?, prod_qty = ?, prod_desc = ? WHERE prod_id = ?;";
		Connection con = DbConnection.getDbConnection();
		
		try (PreparedStatement pst = con.prepareStatement(sql)){
			pst.setString(1, name);
			pst.setDouble(2, price);
			pst.setInt(3, qty);
			pst.setString(4, desc);
			pst.setInt(5, id);
			int r = pst.executeUpdate();
			System.out.println(r);
		}
		catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		finally {
			try {
				assert con != null;
				con.close();
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}




















