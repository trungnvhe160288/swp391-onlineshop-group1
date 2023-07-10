<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/dashboard/role/add.ad" method="POST">
                        <div class="card">
                            <div class="card-header">
                                <h4>Add New Role</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" class="form-control" id="name" value="${name}" >
                                        <small id="passwordHelpBlock" class="form-text text-danger">
                                            ${message}
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-primary" type="submit">Save Changes</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%
session.removeAttribute("message");
%>