# Shopping-app-project

The Online Shopping System has become an essential tool for sellers and also for buyers. The online shopping system in java allows buyers to buy goods/products directly from the seller website and it saves time and money of buyer. There is an advantage of the sellers to attract more customers using online shopping systems and it promotes cashless transactions.

About Online Shopping Project:
We will develop following functionalities in online shopping java project:

Seller/Admin can add the product.
Seller/Admin can edit the product.
Seller/Admin can delete the product.
Seller/Admin can view the product.
Seller/Admin can view the customers.
Seller/Admin can view all orders.
Seller/Admin can view pending orders.
Seller/Admin have a dashboard to check the number of orders, customers, products.
Seller/Admin have basic login and logout functionality.
Buyer/Customer have basic login, register and logout functionality.
Buyer/Customer can view the products.
Buyer/Customer can add the product into the cart.
Buyer/Customer can remove the product from the cart.
Buyer/Customer can change the quantity of products in the cart.
Buyer/Customer can order the product.
Buyer/Customer can view all product ordered history.


Implementation:

Techs used:
Backend Development:
Java Servlets: To handle business logic and server-side processing.
JDBC (Java Database Connectivity): For database operations such as retrieving and storing product, order, and customer data.
Frontend Development:
JSP (Java Server Pages): For rendering dynamic content and user interfaces on the client side.
HTML & CSS: To structure and style the pages, ensuring a user-friendly design.
Database Management:
MySQL: For storing and managing product data, orders, and customer information.
Web Server:
Apache Tomcat: To host and deploy the web application.

Here's the project  structure
![image](https://github.com/user-attachments/assets/7278b9b1-dc0b-4e86-af98-177a7e980c4a)


Steps:
1) Creating Database (MYSQL):
In this step, we basically create java online shopping system database.

And also we create five tables:

a) Admin table for storing information such as username, password, name and admin table is used for login purposes.
b) Cart table for storing information about the cart such as customer_id, quantity, product_id, etc.
c) Customer table for storing information such as username, password, name and customer table is used for login purposes.
d) Order table for storing information the customer has ordered the product from the website such as custiomer_id, product_id, payment_id, customer name, product name, total amount, quantity, address, etc.
e) Product table for storing information about the product such as product_name, id, image, price, mrp price, category, etc.


2) Importing packages
By default, Servlet packages are installed by JAVA (J2EE).
mysql-connector library and apache-commons-fileupload, download and import into the project stucture

3) Features
1. Security Measures
User Authentication & Authorization
Registration and Login:
Customers must register with secure credentials. Passwords should be hashed (e.g., using BCrypt) before storing them in the database to prevent unauthorized access.
Session Management:
After successful login, a session is created to keep the user logged in across different pages. Secure session cookies can be used, and proper session timeout can be implemented to enhance security.
Input Validation and Sanitization
Form Inputs:
User inputs in forms (e.g., registration, product search) should be validated on both client and server sides to prevent SQL injection and XSS (Cross-Site Scripting) attacks.
Prepared Statements:
Use prepared statements for database queries to safeguard against SQL injection attacks by separating SQL logic from user input.
HTTPS
Secure Communication:
Use HTTPS to encrypt data transmitted between the client and server, protecting sensitive information like user credentials and payment details from eavesdropping.
Access Control
Admin and User Roles:
Implement role-based access control to ensure that only authorized users can access certain functionalities, like managing products or viewing sensitive data.

2. Filters
Servlet Filters
Purpose of Filters:
Filters allow you to preprocess requests and responses before they reach the servlet or after the servlet processes them. They can be used for logging, authentication, and modifying request/response data.
Common Filter Implementations:
Authentication Filter:

This filter checks if the user is logged in before allowing access to restricted areas (e.g., admin panel). If not authenticated, redirect them to the login page.
Logging Filter:

Logs request details (like timestamp, user ID, and accessed URL) for monitoring and debugging purposes.
Character Encoding Filter:

Ensures that request and response data are encoded in a consistent character set (like UTF-8) to avoid character-related issues.

3. Database Connectivity
JDBC (Java Database Connectivity)
Connection Establishment:
Use JDBC to connect to the MySQL database. Load the JDBC driver and establish a connection using a connection string that includes database credentials.
Connection Pooling
Efficient Resource Management:
Implement connection pooling (e.g., using Apache DBCP or HikariCP) to improve performance by reusing connections rather than opening and closing new connections for every request.
Database Operations
CRUD Operations:
Implement Create, Read, Update, and Delete operations through JDBC. Use PreparedStatements for executing SQL queries to prevent SQL injection.


Still working on this.....

