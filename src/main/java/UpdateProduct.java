
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Product;
import dao.ProductDao;


@WebServlet("/admin-protected/updateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
        int qty = Integer.parseInt(request.getParameter("qty"));
        double price = Double.parseDouble(request.getParameter("price"));
        String desc = request.getParameter("desc");
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ProductDao.updateProduct(id, name, price, qty, desc);
		
		response.sendRedirect("products?category=" + request.getParameter("cat"));
	}
}
