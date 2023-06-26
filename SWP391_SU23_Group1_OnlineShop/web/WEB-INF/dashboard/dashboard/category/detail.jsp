<jsp:useBean class="DAL.CommonForJSP" id="common"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <form action="${pageContext.request.contextPath}/dashboard/category/detail.ad" method="POST">
                        <div class="card">
                            <div class="card-header">
                                <h4>Category: ${data.name}</h4>
                            </div>
                            
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <div class="row col-6">
                                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Category ID</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input type="text" class="form-control" name='id' value="${data.id}" readonly>
                                        </div>
                                    </div>
                                    <div class="row col-6">
                                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Category Name</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input type="text" class="form-control" name='name' value="${data.name}${name}" required>
                                            <span class="text-danger" id='message'>${message}</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row mb-4">
                                    <div class="row col-6">
                                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Create Date</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input type="text" class="form-control" name='createAt' value="${common.getDateFormat(data.createAt, 'dd-MM-yyyy')}" disabled>
                                        </div>
                                    </div>
                                    <div class="row col-6">
                                        <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3">Update Date</label>
                                        <div class="col-sm-12 col-md-7">
                                            <input type="text" class="form-control" name='updateAt' value="${common.getDateFormat(data.updateAt, 'dd-MM-yyyy')}" disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row mb-4 justify-content-end">
                                    <label class="col-form-label col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <button class="btn btn-primary" type='submit'>Update Category</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

