<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.Product, dao.ProductDao, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f8f8;
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
        justify-content: center;
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .container {
        display: flex;
        gap: 20px;
        width: 100%;
    }

    .left img {
        max-width: 300px;
        height: auto;
        border-radius: 8px;
    }

    .right {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .prod-info h1 {
        font-size: 28px;
        margin-bottom: 10px;
    }

    .buy-info {
        margin-top: 20px;
    }

    .buy-info h3 {
        font-size: 22px;
        color: black; /* Changed color to black */
    }

    .buy-info input[type="number"] {
        width: 50px;
        margin-right: 10px;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .buy-info a {
        display: inline-block;
        padding: 10px 15px;
        background-color: #28a745;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin-right: 10px;
    }

    .buy-info a:hover {
        background-color: #218838;
    }


		.product-grid {
		    display: grid;
		    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
		    gap: 20px;
		}
		
    .iii {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
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
        background-color: grey;
        padding: 20px;
        text-align: center;
        margin-top: 40px;
        box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
    }

    footer a {
        text-decoration: none;
        color: white;
    }

    footer h1 {
        margin: 10px 0;
        font-size: 20px;
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

    <%! 
        private Product product = null;
    %>

    <%
        product = (Product)request.getAttribute("product");
    %>
    
    <main>
        <div class="container">
            <div class="left">
                <img alt="<%=product.getName() %>" src="<%=product.getUrl()%>">
            </div>
            <div class="right">
                <div class="prod-info">
                    <h1><%=product.getName()%></h1>
                    <p><%=product.getDesc()%></p>
                </div>
                <div class="buy-info">
                    <h3>Price: ₹<%=product.getPrice() %></h3> <!-- Color changed to black -->
                    <input type="number" min="1" value="1">
                    <a href="addToCart?productId=<%=product.getId() %>">Add To Cart</a>
                    <a href="buyNow?productId=<%=product.getId() %>">Buy Now</a>
                </div>
            </div>
        </div>
        <!-- Moved the "You may also like" section down -->
                    <h1 class="iii">You may also like</h1>
        <div class="product-grid">
            <%
                List<Product> productList = ProductDao.getProducts(product.getCategory());
                if (productList != null && !productList.isEmpty()) {
                    for (Product prod : productList) {
                        if (prod.getId() == product.getId()) continue;
            %>	
                <a href="displayProduct?productId=<%=prod.getId()%>">
                <div class="product-item">
                    <img src="<%= prod.getUrl() %>" alt="<%= prod.getName() %>" />
                    <h2><%= prod.getName() %></h2>
                    <p>Price: ₹<%= prod.getPrice() %></p>  
                    <p><%= prod.getDesc() %></p>            
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
