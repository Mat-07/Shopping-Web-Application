

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserValidator;

@WebServlet("/register")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		String username = request.getParameter("username");
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		
		String encodedEmail = request.getParameter("email_id");
        
        // Decode the email
        String email = null;
		try {
			email = URLDecoder.decode(encodedEmail, StandardCharsets.UTF_8.name());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		
		try {
			if (UserValidator.validateUser(request, username, firstName, lastName, email, password)) {
				dao.AddUser.addUserToDb(username, firstName, lastName, email, gender, password);
				response.sendRedirect("home.jsp");
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("user-registration.jsp");
				rd.forward(request, response);
			}
		}
		catch (ServletException | IOException e) {
			System.out.println(e.getMessage());
		}
		
		
	}

}
