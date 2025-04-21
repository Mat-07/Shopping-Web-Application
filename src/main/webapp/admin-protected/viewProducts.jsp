<%@page import="java.text.Normalizer.Form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.Product, dao.ProductDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="../css/viewProducts.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Modal Styles */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgba(0,0,0,0.5);
            padding-top: 100px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 300px; 
            text-align: center;
            border-radius: 8px;
        }

        .modal-header {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .modal-footer {
            display: flex;
            justify-content: space-between;
        }

        .modal-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-confirm {
            background-color: #28a745; /* Green */
            color: white;
        }

        .modal-confirm:hover {
            background-color: #218838;
        }

        .modal-cancel {
            background-color: #dc3545; /* Red */
            color: white;
        }

        .modal-cancel:hover {
            background-color: #c82333;
        }
		
		h1:hover{
			cursor: pointer;
		}
		/* Modal Styles */
		.edit-modal {
		    display: none; /* Hidden by default */
		    position: fixed; 
		    z-index: 1000; 
		    left: 0;
		    top: 0;
		    width: 100%; 
		    height: 100%; 
		    overflow: auto; 
		    background-color: rgba(0,0,0,0.5);
		    padding-top: 100px;
		}
		
		.edit-modal-content {
		    background-color: #fefefe;
		    margin: auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 400px; /* Width of modal */
		    border-radius: 8px;
		}
		
		.edit-modal-header {
		    font-size: 20px;
		    margin-bottom: 20px;
		    text-align: center;
		}
		
		.edit-modal-body {
		    display: flex;
		    flex-direction: column;
		}
		
		.editForm {
		    margin-bottom: 15px; /* Spacing between input fields */
		}
		
		.editForm label {
		    margin-bottom: 5px; /* Spacing between label and input */
		    display: block; /* Make label block-level to stack vertically */
		}
		
		.editForm input {
		    width: 100%; /* Full width for input fields */
		    padding: 8px; /* Padding inside input fields */
		    border: 1px solid #ccc; /* Border styling */
		    border-radius: 4px; /* Rounded corners */
		    margin-right: 10px;
		}
		
		.edit-modal-footer {
		    display: flex;
		    justify-content: space-between; /* Space between buttons */
		    margin-top: 20px;
		}
		
		.edit-modal-confirm, .edit-modal-cancel {
		    padding: 10px 15px; /* Button padding */
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.edit-modal-confirm {
		    background-color: #28a745; /* Green */
		    color: white;
		}
		
		.edit-modal-confirm:hover {
		    background-color: #218838;
		}
		
		.edit-modal-cancel {
		    background-color: #dc3545; /* Red */
		    color: white;
		}
		
		.edit-modal-cancel:hover {
		    background-color: #c82333;
		}

        /* Other styles for the product grid can remain the same */
    </style>
</head>
<body>
    <h1>Products</h1>

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
                    <div class="product-item">
                        <div class="product-actions">
                            <a href="#" onclick="openEditModal('<%=product.getId() %>', '<%=product.getName()%>', '<%=product.getPrice()%>','<%=product.getQty()%>', '<%= product.getDesc() %>', '<%=request.getParameter("category")%>'); return false;" class="action-button-edit"><i class="fas fa-edit"></i></a>
                            <a href="#" onclick="openRemoveModal('<%= product.getId() %>'); return false;" class="action-button-remove"><i class="fas fa-trash-alt"></i></a>
                        </div>
                        <img src="<%= product.getUrl() %>" alt="<%= product.getName() %>" />
                        <h2><%= product.getName() %></h2>
                        <p><%= product.getDesc() %></p>
                        <p>Price: ₹<%= product.getPrice() %></p>
                    </div>
        <%
                }
            } else {
        %>
                <p>No products available in this category.</p>
        <%
            }
        %>
    </div>
        <!-- Edit pop up -->
    <div id="editModal" class="edit-modal">
    	<div class="edit-modal-content">
    		<div class="edit-modal-header">Enter Updated Details</div>
    		<div class="edit-modal-body">
    			<form action="updateProduct" method="POST" class="edit-form">
    				
    				<div class="editForm">
    				 	<label for="editName">Name:</label>
    					<input type="text" name="name" id="name" required="required"><br>
    				</div>
    				
    				<div class="editForm">
	    				<label for="editPrice">Price:</label>
	    			    <input type="number" id="price" name="price" step="0.01" required><br>
    				</div>
    				
    				<div class="editForm">
	    				<label for="editQty">Quantity:</label>
	    				<input type="text" name="qty" id="qty" required="required"><br>
    				</div>
    				
    				<div class="editForm">
	    				<label for="editDesc">Description:</label>
	    				<textarea id="desc" name="desc"  rows="5" required></textarea><br>
    				</div>
    				
    				
       				<input type="hidden" name="cat" id="cat">
       				<input type="number" style="display: none;" name="id" id="id">
    				
    				<div class="edit-modal-footer">
                        <button type="submit" class="edit-modal-confirm">Save</button>
                        <button type="button" onclick="closeEditModal();" class="edit-modal-cancel">Cancel</button>
                    </div>
    			</form>
    		</div>
    	</div>
    </div>

    <!-- remove Modal -->
    <div id="removeModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                Confirm Removal
            </div>
            <div class="modal-body">
                Are you sure you want to remove this product?
            </div>
            <div class="modal-footer">
                <button id="confirmRemoveButton" class="modal-button modal-confirm">Yes</button>
                <button onclick="closeRemoveModal();" class="modal-button modal-cancel">No</button>
            </div>
        </div>
    </div>
    
    <script>
    	
    	function openEditModal(id, name, price, qty, desc, cat) {
    		document.getElementById('id').value = id;
    		document.getElementById('name').value = name;
    		document.getElementById('price').value = price;
    		document.getElementById('qty').value = qty;
    		document.getElementById('desc').value = desc;
    		document.getElementById('cat').value = cat;    		
    		document.getElementById('editModal').style.display = 'block';
    	}

    	function closeEditModal () { 
    		document.getElementById('editModal').style.display = 'none';
    	}
    	
        let productIdToRemove;

        function openRemoveModal(productId) { 
            productIdToRemove = productId; 
            document.getElementById("removeModal").style.display = "block"; 
        }

        function closeRemoveModal() { 
            document.getElementById("removeModal").style.display = "none"; 
        }

        document.getElementById("confirmRemoveButton").onclick = function() {
            window.location.href = "removeProduct?id=" + productIdToRemove;
        };

        window.onclick = function(event) { 
            if (event.target === document.getElementById("removeModal")) {
                closeRemoveModal();
            }
            if (event.target === document.getElementById("editModal")) {
            	closeEditModal
            }
        };

    </script>
</body>
</html>
