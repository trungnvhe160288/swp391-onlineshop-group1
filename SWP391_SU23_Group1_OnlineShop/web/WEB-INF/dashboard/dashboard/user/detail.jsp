<jsp:useBean class="Ultils.CommonForJSP" id="common"/>

<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row h-100">
                <div class="col-12 ">
                    <div class="card">
                        <div class="card-header">
                            <h4>Profile: ${data.email}</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-2">
                                    <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab4" data-toggle="tab" href="#profiles" role="tab"
                                               aria-controls="home" aria-selected="true">Profiles</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="profile-tab4" data-toggle="tab" href="#avatar" role="tab"
                                               aria-controls="profile" aria-selected="false">Avatar</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab4" data-toggle="tab" href="#contact4" role="tab"
                                               aria-controls="contact" aria-selected="false">Contact</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-12 col-sm-12 col-md-10">
                                    <div class="tab-content no-padding" id="myTab2Content">
                                        <div class="tab-pane fade show active" id="profiles" role="tabpanel" aria-labelledby="home-tab4">
                                            <section class="section">
                                                <div class="section-body">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="card">
                                                                <div class="card-body">
                                                                    <div class="form-group row mb-4">
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Full Name</label>
                                                                            <div class="col-sm-12">
                                                                                <input type="text" name="fullName" value="${data.fullName}" class="form-control" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Email</label>
                                                                            <div class="col-sm-12">
                                                                                <input type="email" name="email" value="${data.email}" class="form-control" readonly>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row mb-4">
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Address</label>
                                                                            <div class="col-sm-12">
                                                                                <input type="text" name="address" value="${data.address}" class="form-control" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Phone</label>
                                                                            <div class="col-sm-12">
                                                                                <input type="text" name="phone" value="${data.phone}" class="form-control" readonly>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row mb-4">
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Create At</label>
                                                                            <div class="col-sm-12">
                                                                                <input type="text" name="createAt" value="${common.getDateFormat(data.createAt, 'dd-MM-yyyy')}" class="form-control" readonly>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label class="col-form-label  col-12 col-md-3 col-lg-3">Status</label>
                                                                            <form action="${pageContext.request.contextPath}/dashboard/user/detail.ad" method="POST">
                                                                                <input type="hidden" name="id" value="${data.id}">
                                                                                <div class="col-sm-12">
                                                                                    <select ${data.role.id == 1 ? 'disabled' : ''} class="form-control selectric " name="status" id="changeStatus" onchange="this.form.submit()">
                                                                                        <option value="-1" ${data.status == -1 ? 'selected' : ''} class="text-danger">Block</option>
                                                                                        <option value="0" ${data.status == 0 ? 'selected' : ''} class="text-warning">Not Verify</option>
                                                                                        <option value="1" ${data.status == 1 ? 'selected' : ''} class="text-success">Active</option>
                                                                                    </select>                                                                            
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
                                        <div class="tab-pane fade" id="avatar" role="tabpanel" aria-labelledby="profile-tab4">
                                            <section class="section">
                                                <div class="section-body">
                                                    <div class="row mt-sm-4">
                                                        <div class="col-12">
                                                            <div class="card author-box">
                                                                <div class="card-body">
                                                                    <div class="author-box-center">
                                                                        <img style="height: 25rem; width: 25rem" alt="image" src="${pageContext.request.contextPath}${data.avatar}" class="rounded-circle author-box-picture">
                                                                        <div class="clearfix"></div>

                                                                        <div class="author-box-job">User Avatar</div>
                                                                    </div>

                                                                </div>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                        <div class="tab-pane fade" id="contact4" role="tabpanel" aria-labelledby="contact-tab4">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="settingSidebar">
        <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
        </a>
        <div class="settingSidebar-body ps-container ps-theme-default">
            <div class=" fade show active">
                <div class="setting-panel-header">Setting Panel
                </div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Select Layout</h6>
                    <div class="selectgroup layout-color w-50">
                        <label class="selectgroup-item">
                            <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                            <span class="selectgroup-button">Light</span>
                        </label>
                        <label class="selectgroup-item">
                            <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                            <span class="selectgroup-button">Dark</span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Sidebar Color</h6>
                    <div class="selectgroup selectgroup-pills sidebar-color">
                        <label class="selectgroup-item">
                            <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                  data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                        </label>
                        <label class="selectgroup-item">
                            <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                                  data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Color Theme</h6>
                    <div class="theme-setting-options">
                        <ul class="choose-theme list-unstyled mb-0">
                            <li title="white" class="active">
                                <div class="white"></div>
                            </li>
                            <li title="cyan">
                                <div class="cyan"></div>
                            </li>
                            <li title="black">
                                <div class="black"></div>
                            </li>
                            <li title="purple">
                                <div class="purple"></div>
                            </li>
                            <li title="orange">
                                <div class="orange"></div>
                            </li>
                            <li title="green">
                                <div class="green"></div>
                            </li>
                            <li title="red">
                                <div class="red"></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <div class="theme-setting-options">
                        <label class="m-b-0">
                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                   id="mini_sidebar_setting">
                            <span class="custom-switch-indicator"></span>
                            <span class="control-label p-l-10">Mini Sidebar</span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <div class="theme-setting-options">
                        <label class="m-b-0">
                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                                   id="sticky_header_setting">
                            <span class="custom-switch-indicator"></span>
                            <span class="control-label p-l-10">Sticky Header</span>
                        </label>
                    </div>
                </div>
                <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                    <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                        <i class="fas fa-undo"></i> Restore Default
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>