<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
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
                                       aria-selected="false">Slider</a>
                                </li>
                            </ul>
                            <div class="tab-content tab-bordered" id="myTab3Content">
                                <div class="tab-pane fade show active" id="add" role="tabpanel" aria-labelledby="add-tab2">
                                    <form  action="${pageContext.request.contextPath}/dashboard/slider/detail.ad" method="POST" class="needs-validation" enctype="multipart/form-data">
                                        <input type="hidden" name="id" value="${data.id}">
                                        <div class="card-header">
                                            <h4>Detail Slider</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-8">
                                                    <label>Title</label>
                                                    <input type="text" class="form-control" name="title" value="${data.title}" required>
                                                </div>
                                                <div class="form-group col-4">
                                                    <label class="d-block">Active?</label>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="actived" id="inlineradio1" value="true" ${data.active ? 'checked' : ''}>
                                                        <label class="form-check-label" for="inlineradio1"><i data-feather="check" class="text-success"></i></label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="actived" id="inlineradio2" value="false" ${data.active ? '' : 'checked'}>
                                                        <label class="form-check-label" for="inlineradio2"><i data-feather="x" class="text-danger"></i></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group row mb-4 ">
                                                <div class="form-group col-8">
                                                    <label>Sub Title</label>
                                                    <input type="text" class="form-control" name="subTitle" value="${data.subTitle}" required>
                                                </div>
                                                <div class="form-group col-3">
                                                    <label class="col-form-label col-6 " style="margin-top: auto; margin-bottom: auto">Image</label>
                                                    <div class=" col-md-8">
                                                        <div id="image-preview" class="image-preview" 
                                                             style="
                                                             background-repeat: no-repeat;
                                                             background-size: contain;
                                                             background-image: url(${pageContext.request.contextPath}${data.url})
                                                             ">
                                                            <label for="image-upload" id="image-label">Choose File</label>
                                                            <input type="file"  id="image-upload" name="upload_image" value="${data.url}" />
                                                        </div>
                                                    </div>
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