
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common" />


<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper"><h1 class="page-width">Order Details</h1></div>
        </div>
    </div>
    <!--End Page Title-->

    <div class="container">


        <div class="row billing-fields">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 sm-margin-30px-bottom">
                <div class="create-ac-content bg-light-gray padding-20px-all">
                    <form>
                        <fieldset>
                            <h2 class="login-title mb-3">Order Information</h2>
                            <div class="row">
                                <div class="form-group col-md-12 col-lg-12 col-xl-12 required">
                                    <label for="input-lastname">Full Name <span class="required-f">*</span></label>
                                    <input name="fullName" value="${data.fullName}" id="input-lastname" type="text" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-lg-6 col-xl-6 required">
                                    <label for="input-email">E-Mail <span class="required-f">*</span></label>
                                    <input name="email" value="${data.email}" id="input-email" type="email" readonly>
                                </div>
                                <div class="form-group col-md-6 col-lg-6 col-xl-6 required">
                                    <label for="input-telephone">Telephone <span class="required-f">*</span></label>
                                    <input name="telephone" value="${data.phone}" id="input-telephone" type="tel" readonly>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div class="row">
                                <div class="form-group col-md-12 col-lg-12 col-xl-12 required">
                                    <label for="input-address-1">Address <span class="required-f">*</span></label>
                                    <input name="address_1" value="${data.address}" id="input-address-1" type="text" readonly>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div class="row">
                                <div class="form-group col-md-12 col-lg-12 col-xl-12">
                                    <label for="input-company">Order Notes <span class="required-f">*</span></label>
                                    <textarea class="form-control resize-both" rows="3">${data.note}</textarea>
                                </div>
                            </div>
                        </fieldset>
                    </form>
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
                                        <th></th>
                                        <th class="text-left">Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Color</th>
                                        <th>Size</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${data.orderLine}" var="item">
                                        <tr>
                                            <td>
                                                <img style="height: 3rem; width: 3rem" src="${pageContext.request.contextPath}/${item.product.thumbnail_url}" alt="alt"/>
                                            </td>
                                            <td class="text-left">${item.product.name}</td>
                                            <td>${common.getPriceFormat(item.product.lastPrice)}</td>
                                            <td>${item.quantity}</td>
                                            <td>${item.colorID}</td>
                                            <td>${item.sizeID}</td>

                                            <td>${common.getPriceFormat(item.totalPrice)}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="font-weight-600">
                                    <tr>
                                        <td colspan="6" class="text-right">Shipping </td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" class="text-right">Total</td>
                                        <td>${common.getPriceFormat(data.totalPrice)}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" class="text-right">Status</td>
                                        <td class="text-${data.status == 1 ? 'success' : data.status == -1 ? 'danger' : 'warning'}">${data.status == 1 ? 'Paid' : data.status == -1 ? 'Cancel' : 'Pending'}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <hr />

                    <div class="your-payment">
                        <h2 class="payment-title mb-3">More Action</h2>
                        <div class="payment-method">
                            <div class="payment-accordion">
                                <div id="accordion" class="payment-section">
                                    <c:if test="${data.status != 1 && data.status != -1}">
                                        <div class="card mb-2">
                                            <div class="card-header">
                                                <a class="card-link" data-toggle="collapse" href="#collapseOne">Cancel The Order</a>
                                            </div>
                                            <form action="${pageContext.request.contextPath}/cart/orderdetail.do" method="POST">
                                                <div id="collapseOne" class="collapse" data-parent="#accordion">
                                                    <div class="card-body">
                                                        <p class="no-margin font-15 d-flex justify-content-between">
                                                            <span style="font-size: 12px; font-weight: bold; color: red;">Are You Sure That You Want To Cancel This Order?</span>

                                                            <input type="hidden" name="action" value="cancel">
                                                            <input type="hidden" name="id" value="${data.id}">
                                                            <button class="btn btn-danger bg-danger " onclick="this.form.submit()">Cancel</button>
                                                        </p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </c:if>
                                    <div class="card mb-2">
                                        <div class="card-header">
                                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">Number Phone Support</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                            <div class="card-body">
                                                <p class="no-margin font-15"><strong>Site Support</strong> <a style="font-family: Arial, sans-serif; color: #333; text-decoration: none; border-bottom: 1px dashed #333;" href="tel:+84987654321">+84 987654321</a></p>
                                                <p class="no-margin font-15"><strong>Sale Support</strong> <a style="font-family: Arial, sans-serif; color: #333; text-decoration: none; border-bottom: 1px dashed #333;" href="tel:+84123456789">+84 123456789</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</div>