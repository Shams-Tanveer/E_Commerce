<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/26/2022
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@page import="com.example._180041107_assignment03.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%! List<Product> allProducts = new ArrayList<Product>();%>
<%
    Product product = new Product();
    allProducts = product.getAllProducts();

%>
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="card-header my-3">All Products</div>
    <div class="row">
        <%
            for (Product p : allProducts) {

        %>
        <div class="col-md-3">
        <div class="card w-100" style="width: 18rem;">
            <img class="card-img-top" style="height: 18rem;" src="data:image/jpeg;base64,<%=p.getProduct_image()%>" alt="Card">
            <div class="card-body">
                <h5 class="card-title"><%=p.getProduct_name()%>
                </h5>
                <h6 class="card-text">Tk <%=p.getProduct_price()%>BDT
                </h6>
                <form action="AddToCardServlet" method="get">
                    <input hidden name="product_id" value="<%=String.valueOf(p.getId())%>"/>
                    <input class="btn btn-primary" type="submit" value="Add to Cart"/>
                </form>

            </div>
        </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
