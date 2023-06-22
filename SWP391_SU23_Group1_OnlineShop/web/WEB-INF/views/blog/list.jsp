<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.BlogDAO" id="bd"/>
<jsp:useBean class="DAL.UserDAO" id="ud"/>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>


<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center mb-0">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">Blog </h1>
            </div>
        </div>
    </div>
    <!--End Page Title-->
    <div class="bredcrumbWrap">
        <div class="container breadcrumbs">
            <a href="${pageContext.request.contextPath}/" title="Back to the home page">Home</a><span aria-hidden="true">›</span><span>Blog</span>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <!--Sidebar-->
            <div class="col-12 col-sm-12 col-md-3 col-lg-3 sidebar">
                <div class="sidebar_tags">
                    <div class="sidebar_widget">
                        <div class="widget-title">
                            <h2>Recent Blogs</h2>
                        </div>
                        <c:set var="recent" value="${bd.getRecentBlog()}"/>

                        <div class="widget-content">
                            <div class="list list-sidebar-products">
                                <div class="grid">
                                    <c:forEach items="${recent}" var="item">
                                        <div class="grid__item">
                                            <div class="mini-list-item">
                                                <div class="mini-view_image">
                                                    <a class="grid-view-item__link" href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">
                                                        <img class="grid-view-item__image blur-up lazyload"
                                                             data-src="${pageContext.request.contextPath}${item.thumbnail_url}"
                                                             src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="blog thum" />
                                                    </a>
                                                </div>
                                                <div class="details"> 
                                                    <a class="grid-view-item__title" href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">
                                                        ${item.title}</a>
                                                    <div class="grid-view-item__meta">
                                                        <span class="article__date"> 
                                                            <time datetime="2017-05-02T14:33:00Z">${common.getDateFormat(item.createAt, 'dd/MM/yyyy')}</time>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar_widget">
                        <div class="widget-title">
                            <h2>Popular Products</h2>
                        </div>
                        <div class="widget-content">
                            <div class="list list-sidebar-products">
                                <div class="grid">
                                    <c:set var="popular" value="${pd.getProductPopularTopX(5)}"/>
                                    <c:forEach items="${popular}" var="item">
                                        <div class="grid__item">
                                            <div class="mini-list-item">
                                                <div class="mini-view_image">
                                                    <a class="grid-view-item__link" href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}">
                                                        <img class="grid-view-item__image blur-up lazyload"
                                                             data-src="${pageContext.request.contextPath}${item.thumbnail_url}"
                                                             src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="" />
                                                    </a>
                                                </div>
                                                <div class="details">
                                                    <a class="grid-view-item__title" href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}">${item.name}</a>
                                                    <div class="grid-view-item__meta"><span class="product-price__price">
                                                            <span class="money">${item.lastPrice} $</span></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Sidebar-->
            <!--Main Content-->
            <div class="col-12 col-sm-12 col-md-9 col-lg-9 main-col">
                <div class="custom-search">
                    <form action="${pageContext.request.contextPath}/blog/list.do" method="POST" class="input-group search-header search" role="search" style="position: relative;">
                        <input class="search-header__input search__input input-group__field" type="search" value='${blog_search}' name="blog_search" placeholder="Search" aria-label="Search" autocomplete="off">
                        <span class="input-group__btn">
                            <button class="btnSearch" type="submit">
                                <i class="icon anm anm-search-l"></i>
                            </button>
                        </span>
                    </form>
                </div>
                <c:if test="${data.isEmpty()}" >
                    <h2 class="text-warning text-center mt-5">Not Found '${blog_search}'</h2>
                </c:if>

                <c:if test="${!data.isEmpty()}" >
                    <div class="blog--list-view blog--grid-load-more">
                        <c:forEach items="${data}" var="item">
                            <div class="article">
                                <!-- Article Image -->
                                <a class="article_featured-image" href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">
                                    <img class="blur-up lazyload" data-src="${pageContext.request.contextPath}${item.thumbnail_url}"
                                         src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="Images"></a>
                                <h2 class="h3">
                                    <a href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">${item.title}</a>
                                </h2>
                                <ul class="publish-detail">
                                    <li><i class="anm anm-user-al" aria-hidden="true"></i> ${ud.getUserByID(item.user_id).fullName}</li>
                                    <li><i class="icon anm anm-clock-r"></i> <time datetime="2017-05-02">${common.getDateFormat(item.createAt, "dd-MM-yyyy")}</time></li>
                                </ul>
                                <div class="rte hidden-content">
                                    <p>${item.description}</p>
                                </div>
                                <p>
                                    <a href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}" class="btn btn-secondary btn--small">
                                        Read more <i class="fa fa-caret-right" aria-hidden="true"></i>
                                    </a>
                                </p>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="pagination d-flex justify-content-end" >
                        <ul class="" style="margin: unset">
                            <c:if test="${page > 1}">
                                <li class="prev">
                                    <a href="${pageContext.request.contextPath}/blog/list.do?page=${page - 1}${search != null ? '&search=' : ''}${search != null ? search : ''}" >
                                        <i class="fa fa-caret-left" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="${1}" end="${numberOfPage}" var="i">
                                <li class="${page == i ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/blog/list.do?page=${i}${search != null ? '&search=' : ''}${search != null ? search : ''}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${page < numberOfPage}">
                                <li class="next">
                                    <a href="${pageContext.request.contextPath}/blog/list.do?page=${page + 1}${search != null ? '&search=' : ''}${search != null ? search : ''}">
                                        <i class="fa fa-caret-right" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </c:if>
            </div>
            <!--End Main Content-->
        </div>
    </div>

</div>