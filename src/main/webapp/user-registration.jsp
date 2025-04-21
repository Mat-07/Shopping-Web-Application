<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        /* Apply a full-screen background image */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url("/online-shopping-app/img/user-login.png"); /* Adjust path if needed */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .registration-container {
            background-color: rgba(255, 255, 255, 0.9); /* Transparent white background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            width: 400px;
        }

        .registration-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .registration-container input[type="text"],
        .registration-container input[type="email"],
        .registration-container input[type="password"] {
            width: 93%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .registration-container select {
        	width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .registration-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db; /* Blue color */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .registration-container input[type="submit"]:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2>User Registration</h2>
        <form action="register" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="text" name="first_name" placeholder="First Name" required>
            <input type="text" name="last_name" placeholder="Last Name" required>
            <input type="email" name="email_id" placeholder="Email ID" required>
            
            <select name="gender">
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Register">
        </form>
        <div class="error-message">
        	<% 
                    // Display error message if login fails
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                    	request.removeAttribute("errorMessage");
                        out.println(errorMessage);
                    }
                %>
        </div>
    </div>
</body>
</html>
