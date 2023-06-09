<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.DAO" id="dao"/>



<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper"><h1 class="page-width">Checkout</h1></div>
        </div>
    </div>
    <!--End Page Title-->
    <div class="container">
        <c:if test="${cart.items.isEmpty()}">
            <h3 class="text-center">You Don't Have Any Product In Cart</h3>
        </c:if>
        <c:if test="${!cart.items.isEmpty()}">
            <form action="${pageContext.request.contextPath}/cart/checkout.do" method="POST">
                <div class="row billing-fields">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 sm-margin-30px-bottom">
                        <div class="create-ac-content bg-light-gray padding-20px-all">
                            <fieldset>
                                <h2 class="login-title mb-3">Order Address</h2>
                                <div class="row">

                                    <div class="form-group col-md-12 col-lg-12 col-xl-12 required">
                                        <label for="input-lastname">Full Name <span class="required-f">*</span></label>
                                        <input name="fullName" value="${account.fullName}" id="input-lastname" type="text">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6 col-lg-6 col-xl-6 required">
                                        <label for="input-email">E-Mail <span class="required-f">*</span></label>
                                        <input name="email" value="${account.email}" id="input-email" type="email">
                                    </div>
                                    <div class="form-group col-md-6 col-lg-6 col-xl-6 required">
                                        <label for="input-telephone">Telephone <span class="required-f">*</span></label>
                                        <input name="phone" value="${account.phone}" id="input-telephone" type="tel">
                                    </div>
                                </div>
                            </fieldset>

                            <fieldset>
                                <div class="row">

                                    <div class="form-group col-md-12 col-lg-12 col-xl-12 required">
                                        <label for="input-address-1">Address <span class="required-f">*</span></label>
                                        <input name="address" value="${account.address}" id="input-address-1" type="text">
                                    </div>
                                </div>
                            </fieldset>
                                    
                            <fieldset>
                                <div class="row">
                                    <div class="form-group col-md-12 col-lg-12 col-xl-12">
                                        <label for="input-company">Order Notes <span class="required-f">*</span></label>
                                        <textarea class="form-control resize-both" rows="3" name="note"></textarea>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                        <div class="your-order-payment">
                            <div class="your-order">
                                <h2 class="order-title mb-4">Your Order</h2>
                                <div class="table-responsive-sm order-table"> 
                                    <table class="bg-white table table-bordered table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-left">Product Name</th>
                                                <th>Price</th>
                                                <th>Color</th>
                                                <th>Size</th>
                                                <th>Qty</th>
                                                <th>Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach  items="${cart.items}" var="item">
                                                <tr>
                                                    <td class="text-left">${item.product.name}</td>
                                                    <td>${common.getPriceFormat(item.product.price)}</td>
                                                    <td><span class="money" style="background-color: ${dao.getColorById(item.colorID).bgr_hex}; border: 1px solid #000; margin: 0.25rem; padding: 0.25rem 0.75rem"></span></td>
                                                    <td>${dao.getSizeByID(item.sizeID).name}</td>
                                                    <td>${item.quantity}</td>
                                                    <td>${common.getPriceFormat(item.totalPrice)}</td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                        <tfoot class="font-weight-600">
                                            <tr>
                                                <td colspan="5" class="text-right">Shipping </td>
                                                <td>0</td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" class="text-right">Total</td>
                                                <td>${common.getPriceFormat(cart.totalMoney)}</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <hr />
                            <div class="your-payment">
                                <h2 class="payment-title mb-3">payment method</h2>
                                <div class="payment-method">
                                    <div class="payment-accordion">
                                        <div id="accordion" class="payment-section">
                                            <div class="card mb-2">
                                                <div class="card-header">
                                                    <a class="card-link" data-toggle="collapse" href="#collapseOne">COD (Cash On Delivery)</a>
                                                </div>
                                                <div id="collapseOne" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        <p class="no-margin font-15">Make your payment upon delivery of your order. 
                                                            Please have the exact amount ready in cash as our delivery personnel will collect the payment at your doorstep. 
                                                            Your order will be handed over to you once the payment has been successfully collected</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="order-button-payment">

                                        <button class="btn" value="Place order" type="submit">Place Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </c:if>
    </div>
</div>