<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.DAO" id="dao"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12 ">
                    <div class="card">
                        <div class="card-header">
                            <h4>Color Table</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="table-2">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Text_Hex</th>
                                        <th>BGR_Hex</th>
                                        <th>Action</th>
                                    </tr>
                                    <c:set value="${dao.allColor}" var="color"/>
                                    <c:forEach items="${color}" var="item">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.name}</td>
                                            <td>${item.text_hex}</td>
                                            <td style="background-color: ${item.bgr_hex}; padding: 5px"></td>
                                            <td><a href="${pageContext.request.contextPath}/dashboard/color/detail.ad?id=${item.id}" class="btn btn-primary">Detail</a></td>
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