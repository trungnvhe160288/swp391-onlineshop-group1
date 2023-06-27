<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean class="DAL.DAO" id="dao"/>
<jsp:useBean class="DAL.CategoryDAO" id="cd"/>



<div id="page-content">
    <!--Collection Banner-->
    <div class="collection-header">
        <div class="collection-hero">
            <div class="collection-hero__image"><img class="blur-up lazyload" data-src="${pageContext.request.contextPath}/assets/images/cat-women2.jpg" src="${pageContext.request.contextPath}/assets/images/cat-women2.jpg" alt="Women" title="Women" /></div>
            <div class="collection-hero__title-wrapper"><h1 class="collection-hero__title page-width">Shopping</h1></div>
        </div>
    </div>
    <!--End Collection Banner-->
    <div class="container-fluid mt-5">
        <div class="row">
            <!--Sidebar-->
            <div class="col-12 col-sm-12 col-md-3 col-lg-2 sidebar filterbar">
                <div class="closeFilter d-block d-md-none d-lg-none"><i class="icon icon anm anm-times-l"></i></div>
                <div class="sidebar_tags">
                    <form action="${pageContext.request.contextPath}/shop/list.do" method="POST">

                        <!--Categories-->
                        <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title"><h2>Categories</h2></div>
                            <ul>
                                <c:set var="category" value="${cd.all}"/>
                                <c:forEach begin="${0}" end="${category.size() -1}" var="i">
                                    <li>
                                        <input type="checkbox" name="cid" onclick="this.form.submit()"
                                               value="${category.get(i).id}" id="category_${category.get(i).id}"
                                               ${cChecked[i] ? 'checked' : ''}>
                                        <label for="category_${category.get(i).id}"><span><span></span></span>${category.get(i).name}</label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!--Categories-->

                        <!--Price Filter-->
                        <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title">
                                <h2>Price</h2>
                            </div>
                            <div id="slider-range" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
                                <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <p class="no-margin">
                                        <input id="amount" name="price" type="text"></p>
                                </div>
                                <div class="col-12 text-right mt-4">
                                    <button class="btn btn-secondary btn--small" type="submit">filter</button>
                                </div>
                            </div>
                        </div>
                        <!--End Price Filter-->
                        <!--Size Swatches-->
                        <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title"><h2>Sizes</h2></div>
                            <ul class="d-flex" style="flex-wrap: wrap">

                                <c:set var="sizes" value="${dao.allSize}"/>
                                <c:forEach begin="${0}" end="${sizes.size() - 1}" var="i">
                                    <li class="col-6">
                                        <input type="checkbox" name="sid" onclick="this.form.submit()" value="${sizes.get(i).id}" id="size_${sizes.get(i).id}"
                                               ${sChecked[i] ? 'checked' : ''}>
                                        <label for="size_${sizes.get(i).id}"><span><span></span></span>${sizes.get(i).name}</label>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                        <input type="hidden" name="search" value="${search}">

                        <!--End Size Swatches-->
                        <!--Color Swatches-->
                        <div class="sidebar_widget filterBox filter-widget">
                            <div class="widget-title"><h2>Colors</h2></div>
                            <ul class="d-flex" style="flex-wrap: wrap">
                                <div class="filter-color swacth-list clearfix">
                                    <ul class="d-flex" style="flex-wrap: wrap">
                                        <c:set var="color" value="${dao.allColor}"/>
                                        <c:forEach begin="${0}" end="${color.size() - 1}" var="i">
                                            <li class="col-2">
                                                <input type="checkbox" onclick="this.form.submit()" name="clid" 
                                                       value="${color.get(i).id}" id="color_${color.get(i).id}"
                                                       ${clChecked[i] ? 'checked' : ''}>
                                                <label for="color_${color.get(i).id}"><span class="swacth-btn ${color.get(i).name}" style="height: 1.5rem;width: 1.5rem"></span></label>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </form>
                    <!--End Color Swatches-->
                </div>
            </div>
            <!--End Sidebar-->
            <!--Main Content-->
            <div class="col-12 col-sm-12 col-md-9 col-lg-10 main-col">
                <div class="productList">
                    <!--Toolbar-->
                    <button type="button" class="btn btn-filter d-block d-md-none d-lg-none"> Product Filters</button>
                    <div class="toolbar">
                        <div class="filters-toolbar-wrapper">
                            <div class="row d-flex justify-content-between">
                                <div class="col-4 col-md-4 col-lg-4 filters-toolbar__item filters-toolbar__item--count align-items-center">
                                    <span class="filters-toolbar__product-count">Showing: ${numberPerPage}/page</span>
                                </div>

                                <form action="${pageContext.request.contextPath}/shop/list.do" method="POST">
                                    <c:set var="category" value="${cd.all}"/>
                                    <c:forEach begin="${0}" end="${category.size() -1}" var="i">
                                        <input type="checkbox" name="cid" onclick="this.form.submit()"
                                               value="${category.get(i).id}" id="category_${category.get(i).id}"
                                               ${cChecked[i] ? 'checked' : ''} hidden>
                                    </c:forEach>

                                    <c:set var="sizes" value="${dao.allSize}"/>
                                    <c:forEach begin="${0}" end="${sizes.size() - 1}" var="i">
                                        <input type="checkbox" name="sid" onclick="this.form.submit()" value="${sizes.get(i).id}" id="size_${sizes.get(i).id}"
                                               ${sChecked[i] ? 'checked' : ''} hidden>
                                    </c:forEach>

                                    <c:set var="color" value="${dao.allColor}"/>
                                    <c:forEach begin="${0}" end="${color.size() - 1}" var="i">

                                        <input type="checkbox" onclick="this.form.submit()" name="clid" 
                                               value="${color.get(i).id}" id="color_${color.get(i).id}"
                                               ${clChecked[i] ? 'checked' : ''} hidden>
                                    </c:forEach>

                                    <input type="hidden" name="search" value="${search}">


                                    <div class="col-12 col-md-8 col-lg-8 d-flex justify-content-end">
                                        <div class="filters-toolbar__item">
                                            <label for="sortBy" class="hidden">Sort</label>
                                            <select name="sortBy" onchange="this.form.submit()" id="sortBy" class="filters-toolbar__input filters-toolbar__input--sort">
                                                <option value="title-ascending">Sort</option>
                                                <option value="a-z"  ${sortBy == 'a-z' ? 'selected' : ''}>Name, A-Z</option>
                                                <option value="z-a"   ${sortBy == 'z-a' ? 'selected' : ''}>Name, Z-A</option>
                                                <option value="low"  ${sortBy == 'low' ? 'selected' : ''}>Price, Low -> High</option>
                                                <option value="high"  ${sortBy == 'high' ? 'selected' : ''}>Price, High -> Low</option>
                                                <option value="new"  ${sortBy == 'new' ? 'selected' : ''}>Date, New -> Old</option>
                                                <option value="old"  ${sortBy == 'old' ? 'selected' : ''}>Date, Old -> New</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!--End Toolbar-->
                    <div class="grid-products grid--view-items">
                        <div class="row ${data.isEmpty() ? 'justify-content-center': ''} ">
                            <c:if test="${data.isEmpty()}">
                                <div style="text-align: center;">
                                    <img src="https://cdn.dribbble.com/users/1058271/screenshots/3308780/media/178f7adc82972a23bd05f460662d533c.png" alt="No Products" style="width: 500px; height: 500px;">
                                    <h2>We apologize, but the product you are looking for could not be found.</h2>
                                </div>
                            </c:if>
                            <c:if test="${!data.isEmpty()}">
                                <c:forEach  items="${data}" var="item">
                                    <div class="col-6 col-sm-6 col-md-4 col-lg-3 grid-view-item style2 item">
                                        <div class="grid-view_image">
                                            <!-- start product image -->
                                            <a href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}" class="grid-view-item__link">
                                                <!-- image -->
                                                <img style="max-height: 600px;min-height: 280px" class="grid-view-item__image primary blur-up lazyload" data-src="${pageContext.request.contextPath}/${item.thumbnail_url}" src="${pageContext.request.contextPath}/${item.thumbnail_url}" alt="image" title="product">
                                                <!-- End image -->
                                                <!-- Hover image -->
                                                <img style="max-height: 600px;min-height: 280px" class="grid-view-item__image hover blur-up lazyload" data-src="${pageContext.request.contextPath}/${item.thumbnail_url}" src="${pageContext.request.contextPath}/${item.thumbnail_url}" alt="image" title="product">
                                                <!-- End hover image -->
                                                <!-- product label -->
                                                <div class="product-labels rectangular"><span class="lbl on-sale">-${item.discountPercent}</span> <span class="lbl pr-label1">new</span></div>
                                                <!-- End product label -->
                                            </a>
                                            <!-- end product image -->

                                            <!--start product details -->
                                            <div class="product-details hoverDetails text-center mobile">
                                                <!-- product name -->
                                                <div class="product-name">
                                                    <a href="#">${item.name}</a>
                                                </div>
                                                <!-- End product name -->
                                                <!-- product price -->
                                                <div class="product-price">
                                                    <span class="old-price">${item.priceFormat}</span>
                                                    <span class="price">${item.lastPriceFormat}</span>
                                                </div>
                                                <!-- End product price -->
                                                <div class="product-review">
                                                    <i class="font-13 fa fa-star"></i>
                                                    <i class="font-13 fa fa-star"></i>
                                                    <i class="font-13 fa fa-star"></i>
                                                    <i class="font-13 fa fa-star-o"></i>
                                                    <i class="font-13 fa fa-star-o"></i>
                                                </div>
                                                <!-- product button -->
                                                <div class="button-set">
                                                    <a href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}" title="Quick View" class="quick-view-popup quick-view" tabindex="0">
                                                        <i class="icon anm anm-search-plus-r"></i>
                                                    </a>
                                                    <!-- Start product button -->
                                                    <form action="${pageContext.request.contextPath}/shop/addtocart.do" method="post">
                                                        <input type="hidden" name="id" value="${item.id}">
                                                        <input type="hidden" name="quantity" value="1">
                                                        <input type="hidden" name="color" value="${item.color.size() != 0 ? item.color.get(0).id : 0}">
                                                        <input type="hidden" name="size" value="${item.size.size() != 0 ? item.size.get(0).id : 0}">

                                                        <button onclick="this.form.submit()" class="btn btn--secondary cartIcon btn-addto-cart" type="button">
                                                            <i class="icon anm anm-bag-l"></i></button>
                                                    </form>
                                                </div>
                                                <!-- end product button -->
                                            </div>
                                            <!-- End product details -->
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <!--End Main Content-->
                <div class="pagination d-flex justify-content-end" >
                    <ul class="" style="margin: unset">
                        <c:if test="${page > 1}">
                            <li class="prev">
                                <a href="${pageContext.request.contextPath}/shop/list.do?page=${page - 1}${categoryID != null ? categoryID : ''}${sizeID != null ? sizeID : ''}${colorID != null ? colorID : ''}${sortBy != null ? '&sortBy=' : ''}${sortBy != null ? sortBy : ''}${search != null ? '&search=' : ''}${search != null ? search : ''}" >
                                    <i class="fa fa-caret-left" aria-hidden="true"></i>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="${1}" end="${numberOfPage}" var="i">
                            <li class="${page == i ? 'active' : ''}">
                                <a href="${pageContext.request.contextPath}/shop/list.do?page=${i}${categoryID != null ? categoryID : ''}${sizeID != null ? sizeID : ''}${colorID != null ? colorID : ''}${sortBy != null ? '&sortBy=' : ''}${sortBy != null ? sortBy : ''}${search != null ? '&search=' : ''}${search != null ? search : ''}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${page < numberOfPage}">
                            <li class="next">
                                <a href="${pageContext.request.contextPath}/shop/list.do?page=${page + 1}${categoryID != null ? categoryID : ''}${sizeID != null ? sizeID : ''}${colorID != null ? colorID : ''}${sortBy != null ? '&sortBy=' : ''}${sortBy != null ? sortBy : ''}${search != null ? '&search=' : ''}${search != null ? search : ''}">
                                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

