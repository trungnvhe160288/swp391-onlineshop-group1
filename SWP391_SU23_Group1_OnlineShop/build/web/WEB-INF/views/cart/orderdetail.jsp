
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

        <!-- comment -->
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
                                                <img style="height: 3rem; width: 3rem" src="${pageContext.request.contextPath}${item.product.thumbnail_url}" 
                                                     alt="alt"/>
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
                                        <td class="text-${item.status == 1 ? 'success' : 'warning'}">${item.status == 1 ? 'Paid' : 'Pending'}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <hr />


                </div>
            </div>
        </div>
    </div>

</div>