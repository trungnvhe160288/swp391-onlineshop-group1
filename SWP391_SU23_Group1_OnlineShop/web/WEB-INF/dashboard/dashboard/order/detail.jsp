<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="invoice">
                <div class="invoice-print">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="invoice-title">
                                <h2>Invoice - <span class="text-${order.status == -1 ? 'danger' : order.status == 1 ? 'success' : 'warning'}">${order.status == -1 ? 'Cancel' : order.status == 1 ? 'Paid' : 'Pending'}</span></h2>
                                <div class="invoice-number">Order #${order.id}</div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <address>
                                        <strong>Orderer:</strong><br>
                                        <c:set var="orderder" value="${ud.getUserByID(order.uid)}"/>

                                        ${orderder.fullName},<br>
                                        ${orderder.address},<br>
                                        ${orderder.phone},<br>
                                        ${orderder.email}
                                    </address>
                                </div>
                                <div class="col-md-6 text-md-right">
                                    <address>
                                        <strong>Receiver:</strong><br>
                                        ${order.fullName},<br>
                                        ${order.address},<br>
                                        ${order.phone},<br>
                                        ${order.email}
                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <address>
                                        <strong>Note:</strong><br>
                                        <p>${order.note}</p>
                                    </address>
                                </div>
                                <div class="col-md-6 text-md-right">
                                    <address>
                                        <strong>Order Date:</strong><br>
                                        ${common.getDateFormat(order.createAt, 'dd-MM-yyyy')}
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="section-title">Order Summary</div>
                            <p class="section-lead">All items here cannot be deleted.</p>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-md">
                                    <tr>
                                        <th data-width="40">#</th>
                                        <th>Item</th>
                                        <th class="text-center">Price</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-right">Totals</th>
                                    </tr>
                                    <c:set  var="stt" value="${0}"/>
                                    <c:forEach items="${order.orderLine}" var="item">
                                        <c:set  var="stt" value="${stt+1}"/>
                                        <tr>
                                            <td>${stt}</td>
                                            <td>${item.product.name}</td>
                                            <td class="text-center">${item.product.lastPrice}</td>
                                            <td class="text-center">${item.quantity}</td>
                                            <td class="text-right">${item.totalPrice}</td>
                                        </tr>

                                    </c:forEach>
                                </table>
                            </div>
                            <div class="row mt-4">
                                <div class="col-8"></div>
                                <div class="col-lg-4 text-right">
                                    <div class="invoice-detail-item">
                                        <div class="invoice-detail-name">Shipping</div>
                                        <div class="invoice-detail-value">0</div>
                                    </div>
                                    <hr class="mt-2 mb-2">
                                    <div class="invoice-detail-item">
                                        <div class="invoice-detail-name">Total</div>
                                        <div class="invoice-detail-value invoice-detail-value-lg">${order.totalPrice}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${order.status != 1 && order.status != -1}">
                    <div class="text-md-right mb-3">
                        <div class="float-lg-left pb-3 mb-3">
                            <a href="${pageContext.request.contextPath}/dashboard/order/updateStatus.ad?id=${order.id}&status=1" class="btn btn-success btn-icon icon-left text-dark"><i class="fas fa-check"></i> Paid </a>
                            <a href="${pageContext.request.contextPath}/dashboard/order/updateStatus.ad?id=${order.id}&status=-1" class="btn btn-danger btn-icon icon-left text-dark"><i class="fas fa-times"></i> Cancel</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </section>
</div>