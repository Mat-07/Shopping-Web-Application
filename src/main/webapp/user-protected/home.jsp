<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.Product, dao.ProductDao" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
            color: #2c2c2c;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: #2c2c2c;
            transition: color 0.3s ease, opacity 0.3s ease;
        }

        a:hover {
            color: #4e4e4e;
            opacity: 0.7;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #e0e0e0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.5s ease;
            gap: 20px;
        }

        #brandName h1 {
            margin: 0;
            font-size: 2rem;
            font-weight: 700;
            color: black;
        }

        .search-bar {
            flex: 1;
            max-width: 400px;
            display: flex;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 10px 40px 10px 15px;
            border: none;
            border-radius: 20px;
            background-color: #f0f0f0;
            font-size: 1rem;
            outline: none;
            transition: background-color 0.3s;
        }

        .search-bar input:focus {
            background-color: #d9d9d9;
        }

        .search-bar button {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
            color: #666;
            transition: color 0.3s ease;
        }

        .search-bar button:hover {
            color: #333;
        }

        header ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 20px;
        }

        header li {
            cursor: pointer;
            font-size: 1rem;
            transition: opacity 0.3s ease;
        }

        header li:hover {
            opacity: 0.6;
        }

        main {
            flex: 1;
            padding: 20px 40px;
        }

        h1 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Category Menu */
        .category-menu {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .category-menu a {
            margin: 0 8px;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.2s ease-in-out;
        }

        .category-menu a:hover {
            background-color: #bfbfbf;
            transform: scale(1.05);
        }

        /* Product Grid */
		.product-grid {
		    display: grid;
		    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
		    gap: 20px;
		}
		
		/* Product Item */
		.product-item {
		    background-color: white;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    padding: 15px;
		    text-align: center;
		    position: relative; /* Make it a positioned element */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    transition: transform 0.2s;
		    overflow: hidden;
		    height: 350px
		}
		
		.product-item:hover {
		    transform: scale(1.05);
		}
		
		/* Product Image */
		.product-item img {
		    max-width: 100%;
		    height: 200px;
		    object-fit: cover;
		    border-radius: 5px;
		}
		
		/* Product Title and Description */
		.product-item h2 {
		    font-size: 18px;
		    margin: 10px 0;
		    color: #333;
		}
		
		.product-item p {
		    color: #666;
		}

        footer {
            background-color: #e0e0e0;
            padding: 20px;
            text-align: center;
        }

        footer a {
            margin-right: 15px;
            font-size: 1rem;
        }

        footer h1 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        footer ul {
            list-style: none;
            padding: 0;
        }

        footer li {
            margin-bottom: 5px;
        }
    </style>
</head>

<body>
    <header>
        <div id="brandName">
            <h1>Drip</h1>
        </div>

        <div class="search-bar">
            <form action="search" method="GET">
                <input type="text" name="query" placeholder="Search for products..." />
                <button type="submit">search</button>
            </form>
        </div>

        <ul>
            <li>Account</li>
            <li>Cart</li>
            <li><a href="user-logout">Logout</a></li>
        </ul>
    </header>

    <main>
        <div class="category-menu">
            <a href="products?category=all">All Products</a> |
            <a href="products?category=Shirt">Shirts</a> |
            <a href="products?category=T-shirt">T-Shirts</a> |
            <a href="products?category=jean">Jean</a> |
            <a href="products?category=Cotton pants">Cotton pants</a> |
            <a href="products?category=Shorts">Shorts</a> |
            <a href="products?category=Over-sized T-Shirt">Over-sized T-Shirt</a> |
            <a href="products?category=Track pants">Track pants</a> |
            <a href="products?category=Sweat shirts">Sweat shirts</a>
        </div>

        <div class="product-grid">
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>	
            	<a href="displayProduct?productId=<%=product.getId()%>">
            	<div class="product-item">
                    <img src="<%= product.getUrl() %>" alt="<%= product.getName() %>" />
                    <h2><%= product.getName() %></h2>
                    <p>Price: ₹<%= product.getPrice() %></p>                    
                    <p><%= product.getDesc() %></p>
                </div>
            	</a>
            <%
                    }
                } else {
            %>
                <p>No products available in this category.</p>
            <%
                }
            %>
        </div>
    </main>

    <footer>
        <a href="#">About us</a>

        <div>
            <h1>Contacts</h1>
            <ul>
                <li>Email: contact@drip.com</li>
                <li>Phone: +91 12345 67890</li>
            </ul>
        </div>
    </footer>
</body>

</html>


