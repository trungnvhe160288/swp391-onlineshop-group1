<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.DAO" id="dao"/>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12 ">
                    <div class="card">
                        <div class="card-header">
                            <h4>Size Table</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="table-2">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Create_At</th>
                                        <th width="10%">Action</th>
                                    </tr>
                                    <c:set value="${dao.allSize}" var="size"/>
                                    <c:forEach items="${size}" var="item">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.name}</td>
                                            <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                            <td><a href="${pageContext.request.contextPath}/dashboard/size/detail.ad?id=${item.id}" class="btn btn-primary">Detail</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>