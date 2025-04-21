

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDao;

@WebServlet("/admin-protected/add-product")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        int qty = Integer.parseInt(request.getParameter("qty"));
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        
        RequestDispatcher rd = request.getRequestDispatcher("addProduct.jsp");
        
        Part filePart = request.getPart("productImage");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        if (ProductDao.addProduct(productName, qty, price, category, description, "http://localhost:8080/online-shopping-app/assets/" + fileName)) {
        	
        	request.setAttribute("message", "Product uploaded successfully!");
        	uploadImage(request, response, filePart);
        	rd.forward(request, response);
        }
        else {
        	request.setAttribute("message", "Product upload unsuccessfull!");
        	rd.forward(request, response);
        }   
	}
	
	private void uploadImage (HttpServletRequest request, HttpServletResponse response, Part filePart) {
		
		try {
			
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String uploadPath =  "D:/ravi/Projects/Online Shopping/online-shopping-app/src/main/webapp/assets/";
			File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) uploadDir.mkdir();
			
			File file = new File(uploadPath + fileName);
			try (InputStream fileContent = filePart.getInputStream();
					FileOutputStream outputStream = new FileOutputStream(file)) {
				
				byte[] buffer = new byte[1024];
				int bytesRead;
				while ((bytesRead = fileContent.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
 			}
			request.setAttribute("message", "Image uploaded successfully");
		}
		catch (IOException e) {
			System.out.println(e.getLocalizedMessage());
		}

	}
}
