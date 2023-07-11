<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DAL.ProductDAO" id="pd"/>
<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.CommentDAO" id="cd"/>

<c:set var="comments" value="${cd.getCommentByProductId(data.id)}"/>
<c:set var="avgRating" value="${common.takeTotalRating(data.id)}"/>


<div id="page-content">
    <!--MainContent-->
    <div id="MainContent" class="main-content" role="main">
        <!--Breadcrumb-->
        <div class="bredcrumbWrap">
            <div class="container breadcrumbs" role="navigation" aria-label="breadcrumbs">
                <a href="${pageContext.request.contextPath}/" title="Back to the home page">Home</a><span aria-hidden="true">›</span><span>Product Details</span>
            </div>
        </div>
        <!--End Breadcrumb-->

        <div id="ProductSection-product-template" class="product-template__container prstyle1 container product-right-sidebar">
            <!--product-single-->
            <div class="product-single">
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-12 col-12">
                        <div class="product-details-img">
                            <div class="zoompro-wrap product-zoom-right pl-20">
                                <div class="zoompro-span">
                                    <img class="zoompro blur-up lazyload"
                                         data-zoom-image="${pageContext.request.contextPath}${data.thumbnail_url}"
                                         alt=""
                                         src="${pageContext.request.contextPath}${data.thumbnail_url}" />
                                </div>
                                <div class="product-buttons">
<!--                                    <a href="https://www.youtube.com/watch?v=93A2jOW5Mog" class="btn popup-video" title="View Video">
                                        <i class="icon anm anm-play-r" aria-hidden="true"></i>
                                    </a>-->
                                    <a href="#" class="btn prlightbox" title="Zoom">
                                        <i class="icon anm anm-expand-l-arrows" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="lightboximages">
                                <c:forEach items="${data.image}" var="item">
                                    <a href="${pageContext.request.contextPath}${item.url}"
                                       data-size="1462x2048"></a>
                                </c:forEach>
                            </div>
                            <div class="product-thumb">
                                <div id="gallery" class="product-dec-slider-2 product-tab-left">
                                    <a 
                                        data-image="${pageContext.request.contextPath}${data.thumbnail_url}"
                                        data-zoom-image="${pageContext.request.contextPath}${data.thumbnail_url}"
                                        class="slick-slide slick-cloned" data-slick-index="-4"
                                        aria-hidden="true" tabindex="-1">
                                        <img class="blur-up lazyload"
                                             src="${pageContext.request.contextPath}${data.thumbnail_url}"
                                             alt="img_product" />
                                    </a>
                                    <c:set var="count" value="-3"/>
                                    <c:forEach items="${data.image}" var="item">
                                        <a 
                                            data-image="${pageContext.request.contextPath}${item.url}"
                                            data-zoom-image="${pageContext.request.contextPath}${item.url}"
                                            class="slick-slide slick-cloned" data-slick-index="${count}"
                                            aria-hidden="true" tabindex="-1">
                                            <img class="blur-up lazyload"
                                                 src="${pageContext.request.contextPath}${item.url}"
                                                 alt="img_product" />
                                        </a>
                                        <c:set var="count" value="${count + 1}"/>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="product-information">
                            <div class="product-single__meta">
                                <h1 class="product-single__title">${data.name}</h1>

                                <div class="prInfoRow">
                                    <div class="product-stock">
                                        <span class="" style='color: ${data.quantity > 0 ? 'green' : 'red'}'>${data.quantity > 0 ? 'In Stock' : 'Sold Out'}</span> <span class="outstock hide">Unavailable</span> </div>
                                    <div class="product-review">
                                        <a class="reviewLink" href="#tab2">
                                            <c:forEach begin="1" end="5" var="i">
                                                <c:if test="${i <= avgRating}">
                                                    <i class="font-13 fa fa-star"></i>
                                                </c:if>
                                                <c:if test="${i > avgRating}">
                                                    <i class="font-13 fa fa-star-o"></i>
                                                </c:if>
                                            </c:forEach>
                                            <span class="spr-badge-caption">${comments.size()} reviews</span>
                                        </a>
                                    </div>
                                </div>
                                <p class="product-single__price product-single__price-product-template">
                                    <span class="product-price__price product-price__price-product-template">
                                        <span id="ProductPrice-product-template">Unit Price: 
                                            <span class="money">${data.priceFormat}</span>
                                        </span>
                                    </span>
                                </p>

                                <form action="${pageContext.request.contextPath}/shop/detail.do" method="post"  id="product_form_10508262282"  class="product-form product-form-product-template hidedropdown">
                                    <input type="hidden" name="id" value="${data.id}">
                                    <div class="swatch clearfix swatch-0 option1" data-option-index="0">
                                        <div class="product-form__item">
                                            <label class="header">Color:</label>
                                            <c:set var="color" value="${data.color}"/>
                                            <c:if test="${!color.isEmpty()}">
                                                <c:forEach begin="${0}" end="${color.size() - 1}" var="i">
                                                    <div data-value="${color.get(i).name}" class="swatch-element color black available">
                                                        <input class="swatchInput" ${i == 0 ? 'checked' : ''} id="color${color.get(i).id}" type="radio" name="color" value="${color.get(i).id}">
                                                        <label class="swatchLbl color rectangle large" for="color${color.get(i).id}" style="background-color: ${color.get(i).bgr_hex};" title="${color.get(i).name}"></label>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="swatch clearfix swatch-1 option2" data-option-index="1">
                                        <div class="product-form__item">

                                            <label class="header">Size: </label>
                                            <c:set var="size" value="${data.size}"/>
                                            <c:if test="${!size.isEmpty()}">
                                                <c:forEach begin="${0}" end="${size.size() - 1}" var="i">
                                                    <div data-value="${size.get(i).name}" class="swatch-element xs available">
                                                        <input class="swatchInput" ${i == 0 ? 'checked' : ''} id="size${size.get(i).id}" type="radio" name="size" value="${size.get(i).id}">
                                                        <label class="swatchLbl  rectangle" for="size${size.get(i).id}" title="${size.get(i).name}">${size.get(i).name}</label>
                                                    </div>
                                                </c:forEach>
                                            </c:if>

                                        </div>
                                    </div>
                                    <p class="infolinks">
                                        <a href="#sizechart" class="sizelink btn"> Size Guide</a> 
                                        <a href="#productInquiry" class="emaillink btn"> Ask About this Product</a>
                                    </p>
                                    <!-- Product Action -->
                                    <div class="product-action clearfix">
                                        <div class="product-form__item--quantity">
                                            <div class="wrapQtyBtn">
                                                <div class="qtyField">
                                                    <a class="qtyBtn minus" href="javascript:void(0);"><i class="fa anm anm-minus-r" aria-hidden="true"></i></a>
                                                    <input type="text" id="Quantity" name="quantity" value="1" class="product-form__input qty">
                                                    <a class="qtyBtn plus" href="javascript:void(0);"><i class="fa anm anm-plus-r" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                        </div>                                
                                        <div class="product-form__item--submit">
                                            <button type="submit" class="btn product-form__cart-submit">
                                                <span id="AddToCartText-product-template">Add To Cart</span>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- End Product Action -->
                                </form>
                                <div class="display-table shareRow">

                                    <div class="display-table-cell text-right">
                                        <div class="social-sharing">
                                            <a target="_blank" href="#!" class="btn btn--small btn--secondary btn--share share-facebook" title="Share on Facebook">
                                                <i class="fa fa-facebook-square" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Facebook</span>
                                            </a>
                                            <a target="_blank" href="#!" class="btn btn--small btn--secondary btn--share share-twitter" title="Tweet on Twitter">
                                                <i class="fa fa-twitter" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Tweet</span>
                                            </a>
                                            <a href="#!" title="Share on google+" class="btn btn--small btn--secondary btn--share" >
                                                <i class="fa fa-google-plus" aria-hidden="true"></i> <span class="share-title" aria-hidden="true">Google+</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <p class="product-type"><span class="lbl">Category:</span> <a href="" title="${data.category.name}">${data.category.name}</a></p>
                                </div>
                            </div>
                        </div>
                        <!--Product Tabs-->
                        <div class="tabs-listing">
                            <ul class="product-tabs">
                                <li rel="tab1"><a class="tablink">Product Details</a></li>
                                <li rel="tab2"><a class="tablink">Product Reviews</a></li>
                                <li rel="tab3"><a class="tablink">Size Chart</a></li>
                                <li rel="tab4"><a class="tablink">Shipping &amp; Returns</a></li>
                            </ul>
                            <div class="tab-container">
                                <div id="tab1" class="tab-content">
                                    <div class="product-description rte">
                                        <p>${data.description}</p>
                                    </div>
                                </div>
                                <div id="tab2" class="${active == 'doReview' ? 'active' : 'tab-content'}">
                                    <div id="shopify-product-reviews">
                                        <div class="spr-container">
                                            <div class="spr-header clearfix">
                                                <div class="spr-summary">
                                                    <span class="product-review">
                                                        <a class="reviewLink">
                                                            <c:forEach begin="1" end="5" var="i">
                                                                <c:if test="${i <= avgRating}">
                                                                    <i class="font-13 fa fa-star"></i>
                                                                </c:if>
                                                                <c:if test="${i > avgRating}">
                                                                    <i class="font-13 fa fa-star-o"></i>
                                                                </c:if>
                                                            </c:forEach>
                                                        </a>
                                                        <span class="spr-summary-actions-togglereviews">Total Review: ${comments.size()}</span>
                                                    </span>
                                                    <span class="spr-summary-actions">
                                                        <a href="#" class="spr-summary-actions-newreview btn">Write a review</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="spr-content">
                                                <div class="spr-form clearfix">
                                                    <form method="post" action="#" id="new-review-form" class="new-review-form">
                                                        <h3 class="spr-form-title">Write a review</h3>
                                                        <fieldset class="spr-form-contact">
                                                            <div class="spr-form-contact-name">
                                                                <label class="spr-form-label" for="review_author_10508262282">Name</label>
                                                                <input class="spr-form-input spr-form-input-text " id="review_author_10508262282" type="text" name="review[author]" value="" placeholder="Enter your name">
                                                            </div>
                                                            <div class="spr-form-contact-email">
                                                                <label class="spr-form-label" for="review_email_10508262282">Email</label>
                                                                <input class="spr-form-input spr-form-input-email " id="review_email_10508262282" type="email" name="review[email]" value="" placeholder="john.smith@example.com">
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="spr-form-review">
                                                            <div class="spr-form-review-rating">
                                                                <label class="spr-form-label">Rating</label>
                                                                <div class="spr-form-input spr-starrating">
                                                                    <div class="product-review"><a class="reviewLink" href="#"><i class="fa fa-star-o"></i><i class="font-13 fa fa-star-o"></i><i class="font-13 fa fa-star-o"></i><i class="font-13 fa fa-star-o"></i><i class="font-13 fa fa-star-o"></i></a></div>
                                                                </div>
                                                            </div>

                                                            <div class="spr-form-review-title">
                                                                <label class="spr-form-label" for="review_title_10508262282">Review Title</label>
                                                                <input class="spr-form-input spr-form-input-text " id="review_title_10508262282" type="text" name="review[title]" value="" placeholder="Give your review a title">
                                                            </div>

                                                            <div class="spr-form-review-body">
                                                                <label class="spr-form-label" for="review_body_10508262282">Body of Review <span class="spr-form-review-body-charactersremaining">(1500)</span></label>
                                                                <div class="spr-form-input">
                                                                    <textarea class="spr-form-input spr-form-input-textarea " id="review_body_10508262282" data-product-id="10508262282" name="review[body]" rows="10" placeholder="Write your comments here"></textarea>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <fieldset class="spr-form-actions">
                                                            <input type="submit" class="spr-button spr-button-primary button button-primary btn btn-primary" value="Submit Review">
                                                        </fieldset>
                                                    </form>
                                                </div>
                                                <div class="spr-reviews">
                                                    <div class="spr-review">
                                                        <div class="spr-review-header">
                                                            <span class="product-review spr-starratings spr-review-header-starratings"><span class="reviewLink"><i class="fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i></span></span>
                                                            <h3 class="spr-review-header-title">Lorem ipsum dolor sit amet</h3>
                                                            <span class="spr-review-header-byline"><strong>dsacc</strong> on <strong>Apr 09, 2019</strong></span>
                                                        </div>
                                                        <div class="spr-review-content">
                                                            <p class="spr-review-content-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                                                        </div>
                                                    </div>
                                                    <div class="spr-review">
                                                        <div class="spr-review-header">
                                                            <span class="product-review spr-starratings spr-review-header-starratings"><span class="reviewLink"><i class="fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i></span></span>
                                                            <h3 class="spr-review-header-title">Lorem Ipsum is simply dummy text of the printing</h3>
                                                            <span class="spr-review-header-byline"><strong>larrydude</strong> on <strong>Dec 30, 2018</strong></span>
                                                        </div>

                                                        <div class="spr-review-content">
                                                            <p class="spr-review-content-body">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="spr-review">
                                                        <div class="spr-review-header">
                                                            <span class="product-review spr-starratings spr-review-header-starratings"><span class="reviewLink"><i class="fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i></span></span>
                                                            <h3 class="spr-review-header-title">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</h3>
                                                            <span class="spr-review-header-byline"><strong>quoctri1905</strong> on <strong>Dec 30, 2018</strong></span>
                                                        </div>

                                                        <div class="spr-review-content">
                                                            <p class="spr-review-content-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.<br>
                                                                <br>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="tab3" class="tab-content">
                                    <h3>WOMEN'S BODY SIZING CHART</h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <th>Size</th>
                                                <th>XS</th>
                                                <th>S</th>
                                                <th>M</th>
                                                <th>L</th>
                                                <th>XL</th>
                                            </tr>
                                            <tr>
                                                <td>Chest</td>
                                                <td>31" - 33"</td>
                                                <td>33" - 35"</td>
                                                <td>35" - 37"</td>
                                                <td>37" - 39"</td>
                                                <td>39" - 42"</td>
                                            </tr>
                                            <tr>
                                                <td>Waist</td>
                                                <td>24" - 26"</td>
                                                <td>26" - 28"</td>
                                                <td>28" - 30"</td>
                                                <td>30" - 32"</td>
                                                <td>32" - 35"</td>
                                            </tr>
                                            <tr>
                                                <td>Hip</td>
                                                <td>34" - 36"</td>
                                                <td>36" - 38"</td>
                                                <td>38" - 40"</td>
                                                <td>40" - 42"</td>
                                                <td>42" - 44"</td>
                                            </tr>
                                            <tr>
                                                <td>Regular inseam</td>
                                                <td>30"</td>
                                                <td>30½"</td>
                                                <td>31"</td>
                                                <td>31½"</td>
                                                <td>32"</td>
                                            </tr>
                                            <tr>
                                                <td>Long (Tall) Inseam</td>
                                                <td>31½"</td>
                                                <td>32"</td>
                                                <td>32½"</td>
                                                <td>33"</td>
                                                <td>33½"</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <h3>MEN'S BODY SIZING CHART</h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <th>Size</th>
                                                <th>XS</th>
                                                <th>S</th>
                                                <th>M</th>
                                                <th>L</th>
                                                <th>XL</th>
                                                <th>XXL</th>
                                            </tr>
                                            <tr>
                                                <td>Chest</td>
                                                <td>33" - 36"</td>
                                                <td>36" - 39"</td>
                                                <td>39" - 41"</td>
                                                <td>41" - 43"</td>
                                                <td>43" - 46"</td>
                                                <td>46" - 49"</td>
                                            </tr>
                                            <tr>
                                                <td>Waist</td>
                                                <td>27" - 30"</td>
                                                <td>30" - 33"</td>
                                                <td>33" - 35"</td>
                                                <td>36" - 38"</td>
                                                <td>38" - 42"</td>
                                                <td>42" - 45"</td>
                                            </tr>
                                            <tr>
                                                <td>Hip</td>
                                                <td>33" - 36"</td>
                                                <td>36" - 39"</td>
                                                <td>39" - 41"</td>
                                                <td>41" - 43"</td>
                                                <td>43" - 46"</td>
                                                <td>46" - 49"</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <img src="${pageContext.request.contextPath}/assets/images/size.jpg" alt="" />
                                    </div>
                                </div>

                                <div id="tab4" class="tab-content">
                                    <h4>Returns Policy</h4>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eros justo, accumsan non dui sit amet. Phasellus semper volutpat mi sed imperdiet. Ut odio lectus, vulputate non ex non, mattis sollicitudin purus. Mauris consequat justo a enim interdum, in consequat dolor accumsan. Nulla iaculis diam purus, ut vehicula leo efficitur at.</p>
                                    <p>Interdum et malesuada fames ac ante ipsum primis in faucibus. In blandit nunc enim, sit amet pharetra erat aliquet ac.</p>
                                    <h4>Shipping</h4>
                                    <p>Pellentesque ultrices ut sem sit amet lacinia. Sed nisi dui, ultrices ut turpis pulvinar. Sed fringilla ex eget lorem consectetur, consectetur blandit lacus varius. Duis vel scelerisque elit, et vestibulum metus.  Integer sit amet tincidunt tortor. Ut lacinia ullamcorper massa, a fermentum arcu vehicula ut. Ut efficitur faucibus dui Nullam tristique dolor eget turpis consequat varius. Quisque a interdum augue. Nam ut nibh mauris.</p>
                                </div>
                            </div>
                        </div>
                        <!--End Product Tabs-->
                    </div>
                    <!--Product Sidebar-->
                    <div class="col-lg-3 col-md-3 col-sm-12 col-12">
                        <div class="prSidebar sidebar-product">
                            <!--Product Feature-->
                            <div class="prFeatures">    
                                <div class="feature">
                                    <img src="${pageContext.request.contextPath}/assets/images/credit-card.png" alt="Safe Payment" title="Safe Payment" />
                                    <div class="details"><h5>Safe Payment</h5>Pay with the world's most payment methods.</div>
                                </div>
                                <div class="feature">
                                    <img src="${pageContext.request.contextPath}/assets/images/shield.png" alt="Confidence" title="Confidence" />
                                    <div class="details"><h5>Confidence</h5>Protection covers your purchase and personal data.</div>
                                </div>
                                <div class="feature">
                                    <img src="${pageContext.request.contextPath}/assets/images/worldwide.png" alt="Worldwide Delivery" title="Worldwide Delivery" />
                                    <div class="details"><h5>Worldwide Delivery</h5>FREE &amp; fast shipping to over 200+ countries &amp; regions.</div>
                                </div>
                                <div class="feature">
                                    <img src="${pageContext.request.contextPath}/assets/images/phone-call.png" alt="Hotline" title="Hotline" />
                                    <div class="details"><h5>Hotline</h5>Talk to help line for your question on 4141 456 789, 4125 666 888</div>
                                </div>
                            </div>
                            <!--End Product Feature-->
                            <!--Related Product-->
                            <div class="related-product grid-products clearfix">
                                <header class="section-header">
                                    <h2 class="section-header__title text-center h2"><span>Related Products</span></h2>
                                    <p class="sub-heading">You can stop autoplay, increase/decrease aniamtion speed and number of grid to show and products from store admin.</p>
                                </header>
                                <div class="grid">
                                    <c:set var="related" value="${pd.getProductByCategoryIDAnTopX(5, data.category.id)}"/>
                                    <c:forEach items="${related}" var="item">
                                        <div class="grid__item">
                                            <div class="mini-list-item">
                                                <div class="mini-view_image">
                                                    <a class="grid-view-item__link" href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}">
                                                        <img class="grid-view-item__image" src="${pageContext.request.contextPath}/${item.thumbnail_url}" alt="">
                                                    </a>
                                                </div>
                                                <div class="details">
                                                    <a class="grid-view-item__title" href="${pageContext.request.contextPath}/shop/detail.do?id=${item.id}">${item.name}</a>
                                                    <div class="grid-view-item__meta"><span class="product-price__price"><span class="money">${common.getPriceFormat(data.lastPrice)}</span></span></div>
                                                    <div class="product-review">
                                                        <i class="font-13 fa fa-star"></i>
                                                        <i class="font-13 fa fa-star"></i>
                                                        <i class="font-13 fa fa-star"></i>
                                                        <i class="font-13 fa fa-star"></i>
                                                        <i class="font-13 fa fa-star"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!--End Related Product-->
                        </div>
                    </div>
                    <!--Product Sidebar-->
                </div>
            </div>
            <!--End-product-single-->


        </div>
        <!--#ProductSection-product-template-->
    </div>
    <!--MainContent-->
</div>

<!--Scoll Top-->
<span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
<!--End Scoll Top-->

<div class="hide">
    <div id="sizechart">
        <h3>WOMEN'S BODY SIZING CHART</h3>
        <table>
            <tbody>
                <tr>
                    <th>Size</th>
                    <th>XS</th>
                    <th>S</th>
                    <th>M</th>
                    <th>L</th>
                    <th>XL</th>
                </tr>
                <tr>
                    <td>Chest</td>
                    <td>31" - 33"</td>
                    <td>33" - 35"</td>
                    <td>35" - 37"</td>
                    <td>37" - 39"</td>
                    <td>39" - 42"</td>
                </tr>
                <tr>
                    <td>Waist</td>
                    <td>24" - 26"</td>
                    <td>26" - 28"</td>
                    <td>28" - 30"</td>
                    <td>30" - 32"</td>
                    <td>32" - 35"</td>
                </tr>
                <tr>
                    <td>Hip</td>
                    <td>34" - 36"</td>
                    <td>36" - 38"</td>
                    <td>38" - 40"</td>
                    <td>40" - 42"</td>
                    <td>42" - 44"</td>
                </tr>
                <tr>
                    <td>Regular inseam</td>
                    <td>30"</td>
                    <td>30½"</td>
                    <td>31"</td>
                    <td>31½"</td>
                    <td>32"</td>
                </tr>
                <tr>
                    <td>Long (Tall) Inseam</td>
                    <td>31½"</td>
                    <td>32"</td>
                    <td>32½"</td>
                    <td>33"</td>
                    <td>33½"</td>
                </tr>
            </tbody>
        </table>
        <h3>MEN'S BODY SIZING CHART</h3>
        <table>
            <tbody>
                <tr>
                    <th>Size</th>
                    <th>XS</th>
                    <th>S</th>
                    <th>M</th>
                    <th>L</th>
                    <th>XL</th>
                    <th>XXL</th>
                </tr>
                <tr>
                    <td>Chest</td>
                    <td>33" - 36"</td>
                    <td>36" - 39"</td>
                    <td>39" - 41"</td>
                    <td>41" - 43"</td>
                    <td>43" - 46"</td>
                    <td>46" - 49"</td>
                </tr>
                <tr>
                    <td>Waist</td>
                    <td>27" - 30"</td>
                    <td>30" - 33"</td>
                    <td>33" - 35"</td>
                    <td>36" - 38"</td>
                    <td>38" - 42"</td>
                    <td>42" - 45"</td>
                </tr>
                <tr>
                    <td>Hip</td>
                    <td>33" - 36"</td>
                    <td>36" - 39"</td>
                    <td>39" - 41"</td>
                    <td>41" - 43"</td>
                    <td>43" - 46"</td>
                    <td>46" - 49"</td>
                </tr>
            </tbody>
        </table>
        <div style="padding-left: 30px;"><img src="${pageContext.request.contextPath}/assets/images/size.jpg" alt=""></div>
    </div>
</div>

<div class="hide">
    <div id="productInquiry">
        <div class="contact-form form-vertical">
            <div class="page-title">
                <h3>Camelia Reversible Jacket</h3>
            </div>
            <form method="post" action="#" id="contact_form" class="contact-form">
                <input type="hidden" name="form_type" value="contact" />
                <input type="hidden" name="utf8" value="✓" />
                <div class="formFeilds">
                    <input type="hidden" name="contact[product name]" value="Camelia Reversible Jacket">
                    <input type="hidden" name="contact[product link]"
                           value="/products/camelia-reversible-jacket-black-red">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="text" id="ContactFormName" name="contact[name]" placeholder="Name"
                                   value="" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <input type="email" id="ContactFormEmail" name="contact[email]" placeholder="Email"
                                   autocapitalize="off" value="" required>
                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <input required type="tel" id="ContactFormPhone" name="contact[phone]"
                                   pattern="[0-9\-]*" placeholder="Phone Number" value="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <textarea required rows="10" id="ContactFormMessage" name="contact[body]"
                                      placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="submit" class="btn" value="Send Message">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="pswp__bg"></div>
    <div class="pswp__scroll-wrap">
        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>
        <div class="pswp__ui pswp__ui--hidden">
            <div class="pswp__top-bar">
                <div class="pswp__counter"></div><button class="pswp__button pswp__button--close"
                                                         title="Close (Esc)"></button><button class="pswp__button pswp__button--share"
                                                     title="Share"></button><button class="pswp__button pswp__button--fs"
                                               title="Toggle fullscreen"></button><button class="pswp__button pswp__button--zoom"
                                                           title="Zoom in/out"></button>
                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                            <div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip"></div>
            </div><button class="pswp__button pswp__button--arrow--left"
                          title="Previous (arrow left)"></button><button class="pswp__button pswp__button--arrow--right"
                          title="Next (arrow right)"></button>
            <div class="pswp__caption">
                <div class="pswp__caption__center"></div>
            </div>
        </div>
    </div>
</div>
