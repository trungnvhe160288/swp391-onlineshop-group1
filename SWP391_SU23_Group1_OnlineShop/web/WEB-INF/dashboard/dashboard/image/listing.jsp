<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.DAO" id="dao"/>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>

<style>
    span:hover {
        cursor: pointer;
    }
</style>


<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Product Images Listing</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped" id="table-1">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Product ID</th>
                                            <th>Product Name</th>
                                            <th>Images</th>
                                            <th>Create Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="images" value="${dao.allImages}"/>

                                        <c:forEach items="${images}" var="item">
                                            <tr>
                                                <td >${item.id}</td>
                                                <td class="text-center">${item.product_id}</td>
                                                <td>${pd.getProductByID(item.product_id).name}</td>
                                                <td><img alt="image" src="${pageContext.request.contextPath}${item.url}" width="70" height="70"></td>
                                                <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                                <td>
                                                    <div class="dropdown">
                                                        <span id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="badge badge-${item.status ? 'success' : 'danger'}">${item.status ? 'Published' : 'Not Published'}</span>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item ${item.status ? 'active' : ''}" href="${pageContext.request.contextPath}/dashboard/image/updateStatus.ad?id=${item.id}&status=true">Published</a>
                                                            <a class="dropdown-item ${!item.status ? 'active' : ''}" href="${pageContext.request.contextPath}/dashboard/image/updateStatus.ad?id=${item.id}&status=false">Not Published</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/dashboard/image/image.ad?id=${item.id}"><i class="fa fa-eye"></i></a>
                                                </td>
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