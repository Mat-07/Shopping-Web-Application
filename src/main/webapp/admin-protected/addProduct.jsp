<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f4f4f4;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="number"], textarea, select {
            width: 94%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        select {
        	width: 98%;
        }
        input[type="file"] {
            margin-bottom: 15px;
        }
        button {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

    <h1>Add Product</h1>
    <form action="add-product" method="post" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="productName" required>

        <label for="category">Category:</label>
        <select id="category" name="category" required>
            <option value="" disabled selected>Select Category</option>
            <option value="Shirt">Shirt</option>
            <option value="T-shirt">T-shirt</option>
            <option value="Jean">Jean</option>
            <option value="Cotton pants">Cotton pants</option>
            <option value="Shorts">Shorts</option>
            <option value="Over-sized T-Shirt">Over-sized T-Shirt</option>
            <option value="Track pants">Track pants</option>
            <option value="Sweat shirts">Sweat shirts</option>
        </select>
	
		<label for="qty">Quantity:</label>
        <input type="number" id="qty" name="qty" required>
	
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="5" required></textarea>

        <label for="image">Upload Image:</label>
        <input type="file" id="image" name="productImage" accept="assets/*" required>

        <button type="submit">Add Product</button>
    </form>
    
    <div class="error-message">
                <% 
                    // Display error message if login fails
                    String errorMessage = (String) request.getAttribute("message");
                    if (errorMessage != null) {
                    	request.removeAttribute("message");
                        out.println(errorMessage);
                    }
                %>
   </div>

</body>
</html>
