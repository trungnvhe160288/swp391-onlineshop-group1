<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/dashboard/color/detail.ad" method="POST">
                        <input type="hidden" name="id" value="${color.id}">
                        <div class="card">
                            <div class="card-header">
                                <h4>Color Detail</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-8">
                                        <label>Name</label>
                                        <input type="text" name="name" class="form-control" value="${color.name}">
                                        <small id="passwordHelpBlock" class="form-text text-danger">
                                            ${message}
                                        </small>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Color</label>
                                        <input type="color" name="bgr_hex" class="form-control" value="${color.bgr_hex}">
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Text Color</label>
                                        <input type="color" name="text_hex" class="form-control" value="${color.text_hex}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-8 row">
                                        <div class="form-group col">
                                            <label>Create At</label>
                                            <input type="date" class="form-control" value="${color.createAt}" disabled>
                                        </div>
                                        <div class="form-group col">
                                            <label>Update At</label>
                                            <input type="date" class="form-control" value="${color.updateAt}" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <button class="btn btn-primary mr-1" type="submit">Submit</button>
                                    <button class="btn btn-secondary" type="reset">Reset</button>
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