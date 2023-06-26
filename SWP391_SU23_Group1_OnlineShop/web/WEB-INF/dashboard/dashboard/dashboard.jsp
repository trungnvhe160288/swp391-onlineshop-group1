<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.CartDAO" id="cartDao"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>

<c:set var="month" value="${common.currentDate.month + 1}"/>
<c:set var="year" value="${common.currentDate.year + 1900}"/>

<div class="main-content">
    <section class="section">
        <div class="row ">
            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">New Review</h5>
                                        <h2 class="mb-3 font-18">0</h2>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="assets/img/banner/1.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">New Order/months</h5>
                                        <h2 class="mb-3 font-18">${cartDao.getTotalOrderByMonths(month, year)}</h2>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="assets/img/banner/2.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="card">
                    <div class="card-statistic-4">
                        <div class="align-items-center justify-content-between">
                            <div class="row ">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pr-0 pt-3">
                                    <div class="card-content">
                                        <h5 class="font-15">Revenue/month</h5>
                                        <h2 class="mb-3 font-18">${cartDao.getTotalRevenueByMonths(month, year)}  $</h2>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pl-0">
                                    <div class="banner-img">
                                        <img src="assets/img/banner/4.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                        <div class="card ">
                            <div class="card-header">
                                <h4>Revenue chart</h4>
                                <div class="card-header-action"></div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div id="chart1"></div>
                                        <div class="row mb-0">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <div class="list-inline text-center">
                                                    <div class="list-inline-item p-r-30"><i data-feather="arrow-up-circle"
                                                                                            class="col-green"></i>
                                                        <h5 class="m-b-0">$675</h5>
                                                        <p class="text-muted font-14 m-b-0">Weekly Earnings</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <div class="list-inline text-center">
                                                    <div class="list-inline-item p-r-30"><i data-feather="arrow-down-circle"
                                                                                            class="col-orange"></i>
                                                        <h5 class="m-b-0">$1,587</h5>
                                                        <p class="text-muted font-14 m-b-0">Monthly Earnings</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <div class="list-inline text-center">
                                                    <div class="list-inline-item p-r-30"><i data-feather="arrow-up-circle"
                                                                                            class="col-green"></i>
                                                        <h5 class="mb-0 m-b-0">$45,965</h5>
                                                        <p class="text-muted font-14 m-b-0">Yearly Earnings</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="row mt-5">
                                            <div class="col-7 col-xl-7 mb-3">Total customers</div>
                                            <div class="col-5 col-xl-5 mb-3">
                                                <span class="text-big">8,257</span>
                                                <sup class="col-green">+09%</sup>
                                            </div>
                                            <div class="col-7 col-xl-7 mb-3">Total Income</div>
                                            <div class="col-5 col-xl-5 mb-3">
                                                <span class="text-big">$9,857</span>
                                                <sup class="text-danger">-18%</sup>
                                            </div>
                                            <div class="col-7 col-xl-7 mb-3">Project completed</div>
                                            <div class="col-5 col-xl-5 mb-3">
                                                <span class="text-big">28</span>
                                                <sup class="col-green">+16%</sup>
                                            </div>
                                            <div class="col-7 col-xl-7 mb-3">Total expense</div>
                                            <div class="col-5 col-xl-5 mb-3">
                                                <span class="text-big">$6,287</span>
                                                <sup class="col-green">+09%</sup>
                                            </div>
                                            <div class="col-7 col-xl-7 mb-3">New Customers</div>
                                            <div class="col-5 col-xl-5 mb-3">
                                                <span class="text-big">684</span>
                                                <sup class="col-green">+22%</sup>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>New Order Table</h4>
                        <div class="card-header-form">
                            <form>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <th class="text-center">
                                        <div class="custom-checkbox custom-checkbox-table custom-control">
                                            <input type="checkbox" data-checkboxes="mygroup" data-checkbox-role="dad"
                                                   class="custom-control-input" id="checkbox-all">
                                            <label for="checkbox-all" class="custom-control-label">&nbsp;</label>
                                        </div>
                                    </th>
                                    <th>Buyer (FullName)</th>
                                    <th>Products</th>
                                    <th>Create Date</th>
                                    <th>Order Status</th>
                                    <th>Action</th>
                                </tr>
                                <tbody>
                                    <c:set var="newOrder" value="${cartDao.getTopXOrder(5)}"/>
                                    <c:forEach items="${newOrder}" var="item">
                                        <tr>
                                            <td class="p-0 text-center">
                                                <div class="custom-checkbox custom-control">
                                                    <input type="checkbox" data-checkboxes="mygroup" class="custom-control-input"
                                                           id="checkbox-1">
                                                    <label for="checkbox-1" class="custom-control-label">&nbsp;</label>
                                                </div>
                                            </td>

                                            <td>${ud.getUserByID(item.uid).fullName}</td>
                                            <td class="text-truncate">
                                                <c:forEach begin="${0}" end="${(item.orderLine.size() > 3 ? 2 : item.orderLine.size() - 1)}" var="i">
                                                    <c:set var="line" value="${item.orderLine.get(i)}"/>
                                                    <figure class="avatar">
                                                        <img src="${pageContext.request.contextPath}${line.product.thumbnail_url}" alt="img"
                                                             data-toggle="tooltip" title="" data-original-title="${line.product.name}">
                                                    </figure>
                                                </c:forEach>

                                                <c:if test="${item.orderLine.size() > 3}">
                                                    <span class="badge badge-primary ">+${item.orderLine.size() - 3}</span>
                                                </c:if>
                                            </td>
                                            <td>${common.getDateFormat(item.createAt, 'dd-MM-yyyy')}</td>
                                            <td>
                                                <div class="badge badge-${item.status == -1 ? 'danger' : item.status == 1 ? 'success' : 'warning' }">
                                                    ${item.status == -1 ? 'Canel' : item.status == 1 ? 'Paid' : 'Pending' }
                                                </div>
                                            </td>
                                            <td><a href="${pageContext.request.contextPath}/dashboard/order/detail.ad?id=${item.id}" class="btn btn-outline-primary">Detail</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6 col-lg-12 col-xl-6">
                <!--                             Support tickets 
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4>New Review</h4>
                                                </div>
                                                <div class="card-body">
                                                    <div class="support-ticket media pb-1 mb-3">
                                                        <img src="assets/img/users/user-1.png" class="user-img mr-2" alt="">
                                                        <div class="media-body ml-3">
                                                            <div class="badge badge-pill badge-success mb-1 float-right">Feature</div>
                                                            <span class="font-weight-bold">#89754</span>
                                                            <a href="javascript:void(0)">Please add advance table</a>
                                                            <p class="my-1">Hi, can you please add new table for advan...</p>
                                                            <small class="text-muted">Created by <span class="font-weight-bold font-13">John
                                                                    Deo</span>
                                                                &nbsp;&nbsp; - 1 day ago</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="javascript:void(0)" class="card-footer card-link text-center small ">View All</a>
                                            </div>
                                             Support tickets -->
            </div>
            <div class="col-md-6 col-lg-12 col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h4>Product Popular</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity Sold</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <c:set var="popular" value="${pd.getProductPopularTopX(5)}"/>
                                <tbody>
                                    <c:forEach items="${popular}" var="item">
                                        <c:set var="sold" value="${pd.getCountSoldByID(item.id)}"/>
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.name}</td>
                                            <td>${item.lastPrice}</td>
                                            <td>${sold}</td>
                                            <td>${item.lastPrice * sold}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>