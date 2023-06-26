
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Users List</h4>
                        </div>
                        <div class="card-body">
                            <div class="">
                                <table class="table table-striped" id="tableExport">
                                    <thead>
                                        <tr>
                                            <th width="5%">ID</th>
                                            <th width="5%">Avatar</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Role</th>
                                            <th>Create_At</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${user}" var="item">
                                            <tr>
                                                <td>
                                                    ${item.id}
                                                </td>
                                                <td>
                                                    <figure class="avatar mr-2">
                                                        <img src="${pageContext.request.contextPath}${item.avatar}" >
                                                    </figure>
                                                </td>
                                                <td>${item.fullName}</td>
                                                <td>${item.email}</td>
                                                <td>${item.phone}</td>
                                                <td>${item.role.name}</td>
                                                <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                                <td class="text-${item.status == -1 ? 'danger' : item.status == 0 ? 'warning' : item.status == 1 ? 'success' : ''}">${item.status == -1 ? 'Block' : item.status == 0 ? 'Not Verify' : item.status == 1 ? 'Active' : ''}</td>
                                                <td >
                                                    <a href="${pageContext.request.contextPath}/dashboard/user/detail.ad?id=${item.id}" class="btn btn-success"><i data-feather="eye"></i></a>
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