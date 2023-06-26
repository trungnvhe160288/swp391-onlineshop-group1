<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hidden-description{
        overflow: hidden;
        text-overflow: ellipsis;
        line-height: 25px;
        -webkit-line-clamp: 4;
        height: 100px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }
    
    .hidden-title{
        overflow: hidden;
        text-overflow: ellipsis;
        line-height: 25px;
        -webkit-line-clamp: 2;
        height: 50px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }
</style>
<div class="main-content">
    <section class="section">
        <div class="section-body">

            <h2 class="section-title">Blog List</h2>
            <div class="row">
                <c:forEach items="${data}" var="item">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3">
                        <article class="article article-style-b">
                            <div class="article-header">
                                <div class="article-image" 
                                     data-background="${pageContext.request.contextPath}${item.thumbnail_url}"></div>
                            </div>
                            <div class="article-details">
                                <div class="article-title">
                                    <h2 class="hidden-title">
                                        <a href="${pageContext.request.contextPath}/dashboard/blog/detail.ad?id=${item.id}">${item.title}</a>
                                    </h2>
                                </div>
                                    <span class="hidden-description">${item.description}</span>
                                <div class="article-cta">
                                    <a href="${pageContext.request.contextPath}/dashboard/blog/detail.ad?id=${item.id}">Read More <i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </article>
                    </div>
                </c:forEach>
            </div>
        </div>

        <ul class="pagination d-flex justify-content-end">
            <li class="page-item ${page == 1 ? 'disabled' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/dashboard/blog/listing.ad?page=${page - 1}" tabindex="-1">Previous</a>
            </li>
            <c:forEach begin="${1}" end="${numberOfPage}" var="i">
                <li class="page-item ${page == i ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/dashboard/blog/listing.ad?page=${i}">${i}
                        <c:if test="${page == i}">
                            <span class="sr-only">(current)</span>
                        </c:if>
                    </a>
                </li>
            </c:forEach>
            <li class="page-item ${page == numberOfPage ? 'disabled' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/dashboard/blog/listing.ad?page=${page + 1}">Next</a>
            </li>
        </ul>

    </section>
</div>