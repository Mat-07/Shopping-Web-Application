

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminValidator;

@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("adminId"));
			
		}
		catch (NumberFormatException e) {
			System.out.println(e.getMessage());
			sendRd(request, response,"enter valid id");
			
		}
		String password =  request.getParameter("password");
		
		if (dao.AdminValidator.validateAdmin(request, id, password)) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("admin", id);
				response.sendRedirect("./admin-protected/admin-home.jsp");
			} catch (IOException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		else {
			sendRd(request, response, "enter valid credentials");
		}
	}
	
	private void sendRd (HttpServletRequest request, HttpServletResponse response, String message) {
		request.setAttribute("errorMessage", message);
		RequestDispatcher rd = request.getRequestDispatcher("admin-login.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
