<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row">
                <div class="col-10">
                    <div class="card">
                        <div class="card-header">
                            <h4>Sliders (Caption)</h4>
                        </div>
                        <div class="card-body">
                            <div class="owl-carousel owl-theme slider" id="slider2">
                                <c:forEach items="${slider}" var="item">
                                    <div>
                                        <img alt="image" src="${pageContext.request.contextPath}${item.url}">
                                        <div class="slider-caption">
                                            <div class="slider-title">${item.title}</div>
                                            <div class="slider-description">${item.subTitle}</div>
                                            <a href="${pageContext.request.contextPath}/dashboard/slider/detail.ad?id${item.id}" class="nav-link text-warning text-right">View Detail</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>