<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="../css/admin-home.css">
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <nav>
            <ul>
                <li><a href="admin-logout">Logout</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section class="dashboard-options">
            <h2>Manage Products</h2>
            <ul>
                <li><a href="products?category=all">View All Products</a></li>
                <li><a href="addProduct.jsp">Add New Product</a></li>
            </ul>
        </section>

        <section class="dashboard-options">
            <h2>Manage Orders</h2>
            <ul>
                <li><a href="viewDeliveredOrders.jsp">View Delivered Orders</a></li>
                <li><a href="viewPendingOrders.jsp">View Pending Orders</a></li>
            </ul>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 E-Commerce Site. All rights reserved.</p>
    </footer>
</body>
</html>
