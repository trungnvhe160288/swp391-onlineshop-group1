<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean class="Ultils.CommonForJSP" id="common" />
<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper"><h1 class="page-width">My Order</h1></div>
        </div>
    </div>
    <!--End Page Title-->

    
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 main-col">
                <form action="#">
                    <c:if test="${data.isEmpty()}">
                        <h1 class="text-center">You No Have Any Order Before !</h1>
                    </c:if>

                    <c:if test="${!data.isEmpty()}">
                        <div class="wishlist-table table-content table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="product-price text-center alt-font">ID</th>
                                        <th class="product-price text-center alt-font">Total Price</th>
                                        <th class="product-price text-center alt-font">Order Date</th>
                                        <th class="stock-status text-center alt-font">Stock Status</th>
                                        <th class="product-subtotal text-center alt-font"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${data}" var="item">
                                        <tr>
                                            <td class="product-thumbnail text-center">
                                                <a href="#">${item.id}</a>
                                            </td>
                                            <td class="product-price text-center"><span class="amount">${common.getPriceFormat(item.totalPrice)}</span></td>
                                            <td class="product-price text-center"><span class="amount">${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</span></td>

                                            <td class="stock text-center">
                                                <span class="in-stock">${item.status == 1 ? 'Paid' : 'Pending'}</span>
                                            </td>
                                            <td class="product-subtotal text-center">
                                                <a href="${pageContext.request.contextPath}/cart/orderdetail.do?id=${item.id}" class="btn btn-small text-white">Order Infomation</a>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </c:if>
                </form>                   
            </div>
        </div>
    </div>
</div>