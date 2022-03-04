<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2/27/2022
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
          integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<%@page import="com.example._180041107_assignment03.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example._180041107_assignment03.model.Product" %>
<%! List<Cart> shoppingCart = new ArrayList<Cart>();%>
<%! double total = 0;%>
<%
    shoppingCart = (List<Cart>) session.getAttribute("cart_lists");
    List<Product> productList = new Product().getAllProducts();

%>
<%@include file="navbar.jsp" %>
<section class="h-100 h-custom" style="background-color: #87CEEB;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>

                                    </div>
                                    <hr class="my-4">

                                    <%
                                        total = 0;
                                        for (Cart cart : shoppingCart) {
                                            int index = 0;
                                            for (int i = 0; i < productList.size(); i++) {
                                                if (productList.get(i).getId() == cart.getId()) {
                                                    index = i;
                                                    break;
                                                }
                                            }
                                            total += (Integer.valueOf(cart.getQuantity()) * Integer.valueOf(productList.get(index).getProduct_price()));

                                    %>
                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                    src="data:image/jpeg;base64,<%=productList.get(index).getProduct_image()%>"
                                                    class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted"><%=productList.get(index).getProduct_name()%>
                                            </h6>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <a href="modifyCart?param1=decrease&param2=<%=cart.getId()%>"
                                               style="text-decoration: none">
                                                <i class="fas fa-minus p-2"></i>

                                            </a>

                                            <input id="form1" min="0" name="quantity" value="<%=cart.getQuantity()%>"
                                                   type="text"
                                                   class="form-control form-control-sm"/>

                                            <a href="modifyCart?param1=increase&param2=<%=cart.getId()%>"
                                               style="text-decoration: none">

                                                <i class="fas fa-plus p-2"></i>

                                            </a>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h6 class="mb-0">Tk <%=productList.get(index).getProduct_price()%>
                                            </h6>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <a href="modifyCart?param1=removeItem&param2=<%=cart.getId()%>"
                                               class="text-muted"><i class="fas fa-times"></i></a>
                                        </div>
                                    </div>

                                    <hr class="my-4">

                                    <%

                                        }%>

                                    <div class="pt-5">
                                        <h6 class="mb-0"><a href="productList.jsp" class="text-body"><i
                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">items <%= shoppingCart.size()%>
                                        </h5>
                                        <h5>Tk <%=total%>
                                        </h5>
                                    </div>

                                    <h5 class="text-uppercase mb-3">Shipping Cost</h5>

                                    <div class="mb-4 pb-2">
                                        <h5>Standard-Delivery- Tk 50.00</h5>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5>Tk <%=total == 0 ? total + 0 : total + 50%>
                                        </h5>
                                    </div>

                                    <a href="modifyCart?param1=checkOut">
                                        <button type="button" class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">Check Out
                                        </button>
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
