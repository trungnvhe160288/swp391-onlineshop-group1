
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>


<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Orders List</h4>
                        </div>
                        <div class="card-body">
                            <div class="">
                                <table class="table table-striped" id="tableExport">
                                    <thead>
                                        <tr>
                                            <th width="5%">ID</th>
                                            <th>Full Name</th>
                                            <th>Phone</th>
                                            <th>Product</th>
                                            <th>Create_At</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${data}" var="item">
                                            <tr>
                                                <td>
                                                    ${item.id}
                                                </td>
                                                <td>
                                                    ${ud.getUserByID(item.uid).fullName}
                                                </td>
                                                <td>${item.phone}</td>
                                                <td>
                                                    <c:forEach begin="${0}" end="${item.orderLine.size() > 3 ? 2 : item.orderLine.size() - 1}" var="i">
                                                        <c:set var="line" value="${item.orderLine.get(i)}"/>
                                                        <img alt="image" src="${pageContext.request.contextPath}${line.product.thumbnail_url}" width="45" height="45">
                                                        
                                                    </c:forEach>
                                                    <c:if test="${item.orderLine.size() > 3}">
                                                        More
                                                    </c:if>
                                                </td>
                                                <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                                <td class="text-${item.status == -1 ? 'danger' : item.status == 1 ? 'success' : 'warning'}">${item.status == -1 ? 'Cancel' : item.status == 1 ? 'Paid' : 'Pending'}</td>
                                                <td ><a href="${pageContext.request.contextPath}/dashboard/order/detail.ad?id=${item.id}">View</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>