<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row mt-sm-4">
                <div class="col-12 col-md-12 ">
                    <div class="card">
                        <div class="padding-20">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" id="add-tab2" data-toggle="tab" href="#add" role="tab"
                                       aria-selected="false">Blog</a>
                                </li>
                            </ul>
                            <div class="tab-content tab-bordered" id="myTab3Content">
                                <div class="tab-pane fade show active" id="add" role="tabpanel" aria-labelledby="add-tab2">
                                    <form  action="${pageContext.request.contextPath}/dashboard/blog/add.ad" method="POST" class="needs-validation" enctype="multipart/form-data">

                                        <div class="card-header">
                                            <h4>Edit Blog</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-8">
                                                    <label>Title</label>
                                                    <input type="text" class="form-control" name="title" value="${data.title}" required>
                                                </div>
                                                <div class="form-group col-4">
                                                    <label class="d-block">Published</label>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="published" id="inlineradio1" value="true" ${data.published ? 'checked' : ''}>
                                                        <label class="form-check-label" for="inlineradio1"><i data-feather="check" class="text-success"></i></label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="published" id="inlineradio2" value="false" ${!data.published ? 'checked' : ''}>
                                                        <label class="form-check-label" for="inlineradio2"><i data-feather="x" class="text-danger"></i></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-12 my-1">
                                                    <label>Description</label>
                                                    <textarea class="summernote" name="description">${data.description}</textarea>
                                                </div>

                                                <div class="form-group col-12">
                                                    <label>Content</label>
                                                    <textarea class="summernote" name="content">${data.content}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group row mb-4 justify-content-between">
                                                <label class="col-form-label col-6 " style="margin-top: auto; margin-bottom: auto">Thumbnail</label>
                                                <div class=" col-md-6">
                                                    <div id="image-preview" class="image-preview" 
                                                         style="
                                                         background-repeat: no-repeat;
                                                         background-size: contain;
                                                         background-image: url(${pageContext.request.contextPath}${data.thumbnail_url})">
                                                        <label for="image-upload" id="image-label">Choose File</label>
                                                        <input type="file"  id="image-upload" name="upload_image" value="${data.thumbnail_url}" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            <button class="btn btn-primary" type="submit">Add New</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>