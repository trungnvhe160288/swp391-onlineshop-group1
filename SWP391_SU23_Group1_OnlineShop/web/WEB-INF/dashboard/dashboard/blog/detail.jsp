<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DAL.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row mt-sm-4">
                <div class="col-12 col-md-12 col-lg-4">
                    <div class="card author-box">
                        <div class="card-body">
                            <div class="author-box-center">
                                <img alt="image" 
                                     src="${pageContext.request.contextPath}${data.thumbnail_url}" 
                                     class=" author-box-picture w-100">
                                <div class="clearfix"></div>
                                <div class="author-box-job mt-2">Blog Thumbnail</div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4>More</h4>
                        </div>
                        <div class="card-body">
                            <div class="py-4">
                                <p class="clearfix">
                                    <span class="float-left">
                                        Create Date
                                    </span>
                                    <span class="float-right text-muted">
                                        <c:if test="${data.createAt != null}">
                                            ${common.getDateFormat(data.createAt, 'dd/MM/yyyy')}
                                        </c:if>
                                    </span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">
                                        Update Date
                                    </span>
                                    <span class="float-right text-muted">
                                        ${common.getDateFormat(data.updateAt, 'dd/MM/yyyy')}
                                    </span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">
                                        Publised
                                    </span>
                                    <span class="float-right text-${data.published ? 'success' : 'danger'}"><i data-feather="${data.published ? 'check' : 'x'}"></i></span>
                                </p>
                                <p class="clearfix">
                                    <span class="float-left">
                                        Owner
                                    </span>
                                    <span class="float-right text-muted">
                                        <c:set var="owner" value="${ud.getUserByID(data.user_id)}"/>
                                        <a href="#">${owner.fullName}</a>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-12 col-md-12 col-lg-8">
                    <div class="card">
                        <div class="padding-20">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link ${active != 'edit' && active != 'upload' ? 'show active ' : ''}" id="home-tab2" data-toggle="tab" href="#about" role="tab"
                                       aria-selected="true">Content</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link ${active == 'edit' ? 'show active ' : ''}" id="profile-tab2" data-toggle="tab" href="#settings" role="tab"
                                       aria-selected="false">Edit</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link ${active == 'upload' ? 'show active ' : ''}" id="thumbnail-tab2" data-toggle="tab" href="#thumbnail" role="tab"
                                       aria-selected="false">Thumbnail Image</a>
                                </li>
                            </ul>
                            <div class="tab-content tab-bordered" id="myTab3Content">
                                <div class="tab-pane fade ${active != 'edit' && active != 'upload' ? 'show active ' : ''} " id="about" role="tabpanel" aria-labelledby="home-tab2">
                                    <div class="section-title my-1" >Title: <span style="font-weight: 200">${data.title}</span></div>
                                    <div class="section-title my-1">Description:</div>
                                    <ul>
                                        <li>${data.description}</li>
                                    </ul>
                                    <div class="section-title my-1">Content</div>
                                    <p>${data.content}</p>
                                </div>

                                <div class="tab-pane fade ${active == 'upload' ? 'show active ' : ''}" id="thumbnail" role="tabpanel" aria-labelledby="thumbnail-tab2">
                                    <form action="${pageContext.request.contextPath}/dashboard/blog/upload.ad" method="post" enctype="multipart/form-data">
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
                                        <input type="hidden" name="id" value="${data.id}">

                                        <div class="card-footer text-right">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
                                        </div>
                                    </form>
                                </div>

                                <div class="tab-pane fade ${active == 'edit' ? 'show active ' : ''}" id="settings" role="tabpanel" aria-labelledby="profile-tab2">
                                    <form  action="${pageContext.request.contextPath}/dashboard/blog/edit.ad" method="POST" class="needs-validation">
                                        <input type="hidden" name="id" value="${data.id}">

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
                                        </div>
                                        <div class="card-footer text-right">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
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

<%session.removeAttribute("active");%>