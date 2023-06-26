
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.CategoryDAO" id="cd"/>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Categories List</h4>
                        </div>
                        <div class="card-body">
                            <div class="">
                                <table class="table table-striped" id="table-1">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Category Name</th>
                                            <th>Create_At</th>
                                            <th>Update_At</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="category" value="${cd.all}"/>
                                        <c:forEach items="${category}" var="item">
                                            <tr>
                                                <td>
                                                    ${item.id}
                                                </td>
                                                <td>${item.name}</td>

                                                <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                                <td>${common.getDateFormat(item.updateAt, 'dd-MM-yyyy')}</td>
                                                <td><a href="${pageContext.request.contextPath}/dashboard/category/detail.ad?id=${item.id}" class="btn btn-primary">Detail</a></td>
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