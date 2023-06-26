<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <form  action="${pageContext.request.contextPath}/dashboard/size/detail.ad" method="POST">
                        <input type="hidden" name="id" value="${size.id}">
                        <div class="card">
                            <div class="card-header">
                                <h4>Sizing</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" class="form-control" id="name" value="${size.name}" >
                                        <small id="passwordHelpBlock" class="form-text text-danger">
                                            ${message}
                                        </small>
                                    </div>
                                    <div class="row col">
                                        <div class="form-group col-md-6">
                                            <label for="create">Create At</label>
                                            <input type="date" class="form-control" id="create" value="${size.createAt}" disabled>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="upate">Update At</label>
                                            <input type="date" class="form-control" id="upate" value="${size.updateAt}" disabled>
                                        </div>
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