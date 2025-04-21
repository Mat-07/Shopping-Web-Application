

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Product;
import dao.ProductDao;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/admin-protected/products")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String category = request.getParameter("category");
		
		List<Product> products = ProductDao.getProducts(category);
		request.setAttribute("productList", products);
		RequestDispatcher rd = request.getRequestDispatcher("viewProducts.jsp");
		rd.forward(request, response);
	}
}
