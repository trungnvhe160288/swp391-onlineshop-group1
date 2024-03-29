<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>\
<jsp:useBean class="DAL.BlogDAO" id="blogDAO" />

<div id="page-content">
    <div class="slideshow slideshow-wrapper pb-section sliderFull">
        <div class="home-slideshow">
            <c:forEach items="${slider}" var="item">
                <div class="slide">
                    <div class="blur-up lazyload bg-size">
                        <img class="blur-up lazyload bg-img" src="${pageContext.request.contextPath}${item.url}" data-src="${pageContext.request.contextPath}${item.url}"  alt="${item.title}" title="${item.title}" />
                        <div class="slideshow__text-wrap slideshow__overlay classic bottom">
                            <div class="slideshow__text-content bottom">
                                <div class="wrap-caption center">
                                    <h2 class="h1 mega-title slideshow__title">${item.title}</h2>
                                    <span class="mega-subtitle slideshow__subtitle">${item.subTitle}</span>
                                    <span class="btn"><a href="${pageContext.request.contextPath}/shop/list.do" class="text-white">Shop now</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--Image Banners-->
    <div class="section imgBanners">
        <div class="imgBnrOuter">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                        <div class="img-bnr">
                            <div class="inner center">
                                <a href="${pageContext.request.contextPath}/shop/list.do">
                                    <img data-src="${pageContext.request.contextPath}/assets/images/collection/modern1.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern1.jpg" alt="Cap" title="Cap" class="blur-up lazyload" />
                                    <span class="ttl">Cap</span>
                                </a>
                            </div>
                        </div>
                        <div class="img-bnr">
                            <div class="inner center">
                                <a href="${pageContext.request.contextPath}/shop/list.do">
                                    <img data-src="${pageContext.request.contextPath}/assets/images/collection/modern2.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern2.jpg" alt="Sweaters" title="Sweaters" class="blur-up lazyload" />
                                    <span class="ttl">Sweaters</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="inner center">
                            <a href="${pageContext.request.contextPath}/shop/list.do">
                                <img data-src="${pageContext.request.contextPath}/assets/images/collection/modern3.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern3.jpg" alt="Tops" title="Tops" class="blur-up lazyload" />
                                <span class="ttl">Tops</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-3 col-lg-3">
                        <div class="inner center">
                            <a href="${pageContext.request.contextPath}/shop/list.do">
                                <img data-src="${pageContext.request.contextPath}/assets/images/collection/modern4.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern4.jpg" alt="Jeans" title="Jeans" class="blur-up lazyload" />
                                <span class="ttl">Jeans</span>
                            </a>
                        </div>
                        <div class="inner center">
                            <a href="${pageContext.request.contextPath}/shop/list.do">
                                <img data-src="${pageContext.request.contextPath}/assets/images/collection/modern5.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern5.jpg" alt="Shoes" title="Shoes" class="blur-up lazyload" />
                                <span class="ttl">Shoes</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Image Banners-->

    <!--Featured Column-->
    <div class="section featured-column">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="section-header text-center">
                        <h2 class="h2">Most Popular</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <!--Featured Item-->
                <div class="col-12 col-sm-6 col-md-4 col-lg-4 text-center">
                    <p>
                        <a href="#">   
                            <img class="blur-up lazyload" data-src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-1.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-1.jpg" alt="feature-row__image">
                        </a> 
                    </p>
                    <h3 class="h4"><a href="#">NEW-SEASON SUITS</a></h3>
                    <div class="rte-setting"><p>Suitability game strong</p></div>
                    <a href="${pageContext.request.contextPath}/shop/list.do" class="btn no-border">Shopping</a>
                </div>
                <!--End Featured Item-->
                <!--Featured Item-->
                <div class="col-12 col-sm-6 col-md-4 col-lg-4 text-center">
                    <p>
                        <a href="#">   
                            <img class="blur-up lazyload" data-src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-2.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-2.jpg" alt="feature-row__image">
                        </a> 
                    </p>
                    <h3 class="h4"><a href="#">STANDOUT SEQUINS</a></h3>
                    <div class="rte-setting"><p>Studio 2018</p></div>
                    <a href="${pageContext.request.contextPath}/shop/list.do" class="btn no-border">Shop Now</a>
                </div>
                <!--End Featured Item-->
                <!--Featured Item-->
                <div class="col-12 col-sm-6 col-md-4 col-lg-4 text-center">
                    <p>
                        <a href="#">   
                            <img class="blur-up lazyload" data-src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-3.jpg" src="${pageContext.request.contextPath}/assets/images/collection/modern-fi-3.jpg" alt="feature-row__image">
                        </a> 
                    </p>
                    <h3 class="h4"><a href="#">COLD-WEATHER ACCESSORIES</a></h3>
                    <div class="rte-setting"><p>Coats are only the beginning</p></div>
                    <a href="${pageContext.request.contextPath}/shop/list.do" class="btn no-border">Shopping</a>
                </div>
                <!--End Featured Item-->
            </div>
        </div>
    </div>
    <!--End Featured Column-->

    <!--Latest Blog-->
    <div class="latest-blog section">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="section-header text-center">
                        <h2 class="h2">Latest From our Blog</h2>
                        <p>Discover the Latest from Our Blog: A Treasure Trove of Exciting Products, Collections, and Engaging Content!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:set var="latest" value="${blogDAO.getTopXBlogAndPublished(2)}"/>
                <c:forEach items="${latest}" var="item">
                    <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="wrap-blog">
                            <a href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}" class="article__grid-image">
                                <img src="${pageContext.request.contextPath}${item.thumbnail_url}" alt="It's all about how you wear" title="It's all about how you wear" class="blur-up lazyloaded"/>
                            </a>
                            <div class="article__grid-meta article__grid-meta--has-image">
                                <div class="wrap-blog-inner">
                                    <h2 class="h3 article__title">
                                        <a href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">${item.title}</a>
                                    </h2>
                                    <span class="article__date">May 02, 2017</span>
                                    <div class="rte article__grid-excerpt">
                                        ${item.description}

                                    </div>
                                    <ul class="list--inline article__meta-buttons">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/blog/detail.do?id=${item.id}">Read more</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!--End Latest Blog-->

    <!--Store Feature-->
    <div class="store-feature section">
        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <ul class="display-table store-info">
                        <li class="display-table-cell">
                            <i class="icon anm anm-truck-l"></i>
                            <h5>Free Shipping</h5>
                            <span class="sub-text">
                                Enjoy free shipping on all orders.
                            </span>
                        </li>
                        <li class="display-table-cell">
                            <i class="icon anm anm-money-bill-ar"></i>
                            <h5>Money Back Guarantee</h5>
                            <span class="sub-text">
                                Shop with confidence knowing that we offer a money-back guarantee on all purchases
                            </span>
                        </li>
                        <li class="display-table-cell">
                            <i class="icon anm anm-comments-l"></i>
                            <h5>24/7 Help Center</h5>
                            <span class="sub-text">
                                Our 24/7 help center is always available to assist you with any inquiries or issues you may have.
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--End Store Feature-->

</div>