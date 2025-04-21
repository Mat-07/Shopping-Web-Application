<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="../css/index.css"> <!-- Adjust path as necessary -->
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #fff;
        }
        .login-container {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
            max-width: 400px;
            width: 100%;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 94%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .login-container input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="adminLogin" method="POST">
            <input type="text" name="adminId" placeholder="Admin ID" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
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
        </form>
    </div>
</body>
</html>
