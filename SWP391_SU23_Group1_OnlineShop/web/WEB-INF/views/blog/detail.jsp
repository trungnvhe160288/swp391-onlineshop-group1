<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.BlogDAO" id="bd"/>



<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center mb-0">
        <div class="page-title">
            <div class="wrapper"><h1 class="page-width">Blog: ${data.title}</h1></div>
        </div>
    </div>
    <!--End Page Title-->
    <div class="bredcrumbWrap">
        <div class="container breadcrumbs">
            <a href="${pageContext.request.contextPath}/" title="Back to the home page">Home</a><span aria-hidden="true">›</span>
            <a href="${pageContext.request.contextPath}/blog/list.do" title="Back to News">Blog</a><span aria-hidden="true">›</span>
            <span>${data.title}</span>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <!--Main Content-->
            <div class="col-12 col-sm-12 col-md-9 col-lg-9 main-col">
                <div class="blog--list-view">
                    <div class="article"> 
                        <!-- Article Image --> 
                        <a class="article_featured-image" href="#">
                            <img class="blur-up lazyload" data-src="${pageContext.request.contextPath}${data.thumbnail_url}" src="${pageContext.request.contextPath}${data.thumbnail_url}" alt="blog thum"></a> 
                        <h1>
                            <a href="blog-left-sidebar.html">${data.title}</a>
                        </h1>
                        <ul class="publish-detail">                      
                            <li><i class="anm anm-user-al" aria-hidden="true"></i>  User</li>
                            <li><i class="icon anm anm-clock-r"></i> <time datetime="2017-05-02">${common.getDateFormat(data.createAt, 'dd-MM-yyyy')}</time></li>

                        </ul>
                        <div class="rte"> 
                            <p>${data.description}</p>
                        </div>
                        <hr/>
                        <div class="rte" style="white-space: pre-wrap;">
                            <p style="font-size: 16px; color: #333; font-weight: bold; font-style: italic;">${data.content}</p>
                        </div>
                        <div class="social-sharing">
                            <a target="_blank" href="#" class="btn btn--small btn--secondary btn--share share-facebook" title="Share on Facebook">
                                <i class="fa fa-facebook-square" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Share</span>
                            </a>
                            <a target="_blank" href="#" class="btn btn--small btn--secondary btn--share share-twitter" title="Tweet on Twitter">
                                <i class="fa fa-twitter" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Tweet</span>
                            </a>
                            <a href="#" title="Share on google+" class="btn btn--small btn--secondary btn--share" >
                                <i class="fa fa-google-plus" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Google+</span>
                            </a>
                            <a target="_blank" href="#" class="btn btn--small btn--secondary btn--share share-pinterest" title="Pin on Pinterest">
                                <i class="fa fa-pinterest" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Pin it</span>
                            </a>
                            <a href="#" class="btn btn--small btn--secondary btn--share share-pinterest" title="Share by Email" target="_blank">
                                <i class="fa fa-envelope" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Email</span>
                            </a>
                        </div>
                        <!--                        <div class="blog-nav">
                                                    <div class="text-left">
                                                        <i class="icon icon-arrow-circle-left"></i>
                                                        <a href="${pageContext.request.contextPath}/blog/detail.do?id=${data.id - 1}" title="">Previous</a>
                                                    </div>
                                                    <div class="text-right">
                                                        <a href="${pageContext.request.contextPath}/blog/detail.do?id=${data.id + 1}" title="">Next</a>
                                                        <i class="icon icon-arrow-circle-right"></i>
                                                    </div>
                                                </div>-->
                        <div class="blog-nav">
                            <div class="text-left" style="${data.id == 1 ? 'display: none;' : ''}">
                                <i class="icon icon-arrow-circle-left"></i>
                                <a href="${pageContext.request.contextPath}/blog/detail.do?id=${data.id - 1}" title="">Previous</a>
                            </div>
                            <div class="text-right">
                                <a href="${pageContext.request.contextPath}/blog/detail.do?id=${data.id + 1}" title="">Next</a>
                                <i class="icon icon-arrow-circle-right"></i>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--End Main Content-->
            <!--Sidebar-->
            <div class="col-12 col-sm-12 col-md-3 col-lg-3 sidebar">
                <div class="sidebar_tags">

                    <div class="sidebar_widget">


                        <c:set var="recent" value="${bd.getRecentBlog()}"/>
                        <div class="widget-title"><h2>Recent Posts</h2></div>
                        <div class="widget-content">
                            <div class="list list-sidebar-products">
                                <div class="grid">
                                    <c:forEach items="${recent}" var="item">
                                        <div class="grid__item">
                                            <div class="mini-list-item">
                                                <div class="mini-view_image">
                                                    <a class="grid-view-item__link" href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">
                                                        <img class="grid-view-item__image blur-up lazyload" data-src="${pageContext.request.contextPath}${item.thumbnail_url}" src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="" />
                                                    </a>
                                                </div>
                                                <div class="details"> 
                                                    <a class="grid-view-item__title" href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">${item.title}</a>
                                                    <div class="grid-view-item__meta">
                                                        <span class="article__date"><time datetime="2017-05-02T14:33:00Z">${common.getDateFormat(item.createAt, 'dd/MM/yyyy')}</time></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar_widget static-banner">
                        <img src="${pageContext.request.contextPath}/assets/images/side-banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
            <!--End Sidebar-->
        </div>
    </div>

</div>