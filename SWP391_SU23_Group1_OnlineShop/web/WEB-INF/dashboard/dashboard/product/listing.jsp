<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>


<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Product Listing</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped" id="table-2">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Product Name</th>
                                            <th>Images</th>
                                            <th>Create Date</th>
                                            <th>Quantity</th>
                                            <th>Quantity Sold</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${data}" var="item">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.name}</td>
                                                <td>
                                                    <c:forEach items="${item.image}" var="image">
                                                        <img alt="image" src="${pageContext.request.contextPath}${image.url}" width="45" height="45">
                                                    </c:forEach>
                                                </td>
                                                <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                                <td>${item.quantity}</td>
                                                <td>${pd.getCountSoldByID(item.id)}</td>
                                                <td><a href="${pageContext.request.contextPath}/dashboard/product/detail.ad?id=${item.id}" class="btn btn-primary">Detail</a></td>
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