package dao;

import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

public class UserValidator {
	
	public static boolean validateUser (HttpServletRequest req, String username, String firstName, 
										String lastName, String email,String password) {
		
		if (!isValidUsername(username)) {
			req.setAttribute("errorMessage", "Enter a valid username ");
			return false;
		}
		if (!isValidEmail(email)) {
			req.setAttribute("errorMessage", "Enter a valid email");
			return false;
		}
		if (!isValidName(firstName)) {
			req.setAttribute("errorMessage", "Enter a first name");
			return false;
		}
		if (!isValidName(lastName)) {
			req.setAttribute("errorMessage", "Enter a last name");
			return false;
		}
		if (password.length() > 5) {
			req.setAttribute("errorMessage", "Password must be more than 5 Characters");
		}
		
		return true;
	}
	
	

    // Method to validate the name
    public static boolean isValidName(String name) {
    	String regex = "^[A-Za-z]{1}[a-z]{0,29}$";
    	Pattern pattern = Pattern.compile(regex);
        if (name == null) 
        	return false;  // Null check
        return pattern.matcher(name).matches();
    }

    // Method to validate the username
    public static boolean isValidUsername(String username) {
    	String regex = "^[a-zA-Z][a-zA-Z0-9_]{3,19}$";
    	Pattern pattern = Pattern.compile(regex);
        if (username == null && !pattern.matcher(username).matches()) {
        	
        	return false;
        }
        return true;
    }
	
	// Method to validate email
	public static boolean isValidEmail(String email) {
		String regex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +
	            "(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
		Pattern pattern = Pattern.compile(regex);
		System.out.println(email);
		if (email == null) 
			return false;
		return pattern.matcher(email).matches();
	}
	
	
	public static void main(String[] args) {
		String email = "subanraja07@gamil.com";
		String username = "ravi_roxx";
		String firstName = "ravi";
		String lastName = "D";
		String password = "tsycghjsgch";
		
//		System.out.println(validateUser(null, username, firstName, lastName, email, password));
		
	}

}
