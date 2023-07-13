<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.CartDAO" id="cartDao"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>
<jsp:useBean class="DAL.CommentDAO" id="cd"/>


<c:set var="month" value="${common.currentDate.month + 1}"/>
<c:set var="year" value="${common.currentDate.year + 1900}"/>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
                                        <h2 class="mb-3 font-18">${cd.getTotalCommentByMonthAndYear(month, year)}</h2>
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
        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div>
                            <h4>Revenue chart</h4>
                        </div>
                        <div>
                            <form action="" method="get">
                                <select class="form-control" name='year' onchange='this.form.submit()'>
                                    <c:forEach begin="0" end="5" var="i">
                                        <option value="${year - i}" ${selectedYear == year-i ? 'selected' : ''}>${year - i}</option>
                                    </c:forEach>
                                </select>
                            </form>
                        </div>
                    </div>
                    <div class="card-body">
                        <div>
                            <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
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

<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                    label: 'Revenue of ' + ${selectedYear},
                    data: [<c:forEach items="${chart}" var="item">${item}, </c:forEach>],
                    fill: true,
                    borderWidth: 1,
                    borderColor: 'rgb(75, 192, 192)'
                }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>