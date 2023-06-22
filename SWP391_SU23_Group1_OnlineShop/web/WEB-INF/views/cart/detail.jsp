<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean class="Ultils.CommonForJSP" id="common"/>
<jsp:useBean class="DAL.DAO" id="dao"/>



<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">Your cart</h1>
            </div>
        </div>
    </div>
    <!--End Page Title-->

    <div class="container">
        <div class="row">
            <c:if test="${cart.items.isEmpty()}">
                <div class="col-12 text-center">
                    <div style="display: flex; flex-direction: column; align-items: center;">
                        <img src="https://images.genial.ly/5aaa5a140c5abf545bfee334/18f0dd37-25c7-4fb9-9929-e3e42112ddc7.png" alt="Empty Cart List" style="width: 350px; height: 300px; margin: auto;">
                        <h2 style="margin-top: 20px;">You don't have any products in your cart yet!</h2>
                        <a href="${pageContext.request.contextPath}/shop/list.do" class="btn" style="margin-top: 20px;">Go to Shopping Site</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${!cart.items.isEmpty()}">
                <div class="col-12 col-sm-12 col-md-9 col-lg-9 main-col">
                    <div  class="cart style2">
                        <table>
                            <thead class="cart__row cart__header">
                                <tr>
                                    <th colspan="3" class="text-center">Product</th>
                                    <th class="">Price</th>
                                    <th class="">Color</th>
                                    <th class="">Size</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-right">Total</th>
                                    <th class="action">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart.items}" var="item">
                                    <c:set var="itemColor" value="${dao.getColorById(item.colorID)}"/>
                                    <c:set var="itemSize" value="${dao.getSizeByID(item.sizeID)}"/>

                                    <tr class="cart__row border-bottom line1 cart-flex border-top">
                                        <td class="cart__image-wrapper cart-flex-item">
                                            <a href="${pageContext.request.contextPath}/shop/detail.do?id=${item.product.id}">
                                                <img src="${pageContext.request.contextPath}/${item.product.thumbnail_url}" class="cart__image" alt="Minerva Dress black" ></a>
                                        </td>
                                        <td class="cart__meta small--text-left cart-flex-item">
                                            <div class="list-view-item__title">
                                                <a href="${pageContext.request.contextPath}/shop/detail.do?id=${item.product.id}">${item.product.name}</a>
                                            </div>
                                        </td>
                                        <td></td>
                                        <td class="cart__price-wrapper cart-flex-item">
                                            <span class="money">${item.product.lastPriceFormat}</span>
                                        </td>
                                        <td class="cart__price-wrapper cart-flex-item" >
                                            <span class="money"  style="background-color: ${itemColor.bgr_hex}; border: 1px solid #000; padding: 5px 10px"></span>
                                        </td>
                                        <td class="cart__price-wrapper cart-flex-item">
                                            <span class="money">${item.sizeID}</span>
                                        </td>
                                        <td class="cart__update-wrapper cart-flex-item text-right">
                                            <form action="${pageContext.request.contextPath}/cart/process.do" method="get">
                                                <div class="cart__qty text-center">
                                                    <div class="qtyField">
                                                        <a class="qtyBtn minus" ${item.quantity == 1 ? 'disable' : ''} href="${pageContext.request.contextPath}/cart/process.do?id=${item.product.id}&action=minus" >
                                                            <i class="icon icon-minus"></i>
                                                        </a>
                                                        <input class="cart__qty-input qty" type="text" name="quantity" id="qty" value="${item.quantity}">
                                                        <a class="qtyBtn plus" href="${pageContext.request.contextPath}/cart/process.do?id=${item.product.id}&action=plus" >
                                                            <i class="icon icon-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </form>

                                        </td>
                                        <td class="text-right small--hide cart-price">
                                            <div><span class="money">${common.getPriceFormat(item.totalPrice)}</span></div>
                                        </td>

                                        <td class="text-center small--hide">
                                            <form action="${pageContext.request.contextPath}/cart/process.do" method="GET">
                                                <input type="hidden" name="id" value="${item.product.id}">
                                                <input type="hidden" name="action" value="remove">

                                                <button onclick="this.form.submit()" class="btn btn--secondary cart__remove" title="Remove tem">
                                                    <i class="icon icon anm anm-times-l"></i></button>
                                            </form>

                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="12" class="text-right">
                                        <a href="${pageContext.request.contextPath}/shop/list.do" class="btn--link cart-continue">
                                            <i class="icon icon-arrow-circle-left"></i> Continue shopping
                                        </a>
                                    </td>

                                </tr>
                            </tfoot>
                        </table>
                        <div class="currencymsg">We processes all orders in USD. While the content of your cart is
                            currently displayed in USD, the checkout will use USD at the most current exchange rate.
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-3 col-lg-3 cart__footer">

                    <div class="solid-border">
                        <div class="row">
                            <span class="col-12 col-sm-6 cart__subtotal-title"><strong>Subtotal</strong></span>
                            <span class="col-12 col-sm-6 cart__subtotal-title cart__subtotal text-right"><span
                                    class="money">${common.getPriceFormat(cart.totalMoney)}</span></span>
                        </div>
                        <div class="cart__shipping">Shipping &amp; taxes calculated at checkout</div>

                        <a href="${pageContext.request.contextPath}/cart/checkout.do"class="btn btn--small-wide checkout w-100">
                            Checkout
                        </a>

                        <div class="paymnet-img">
                            <img src="${pageContext.request.contextPath}/assets/images/payment-img.jpg" alt="Payment">
                        </div>
                    </div>

                </div>
            </c:if>

        </div>
    </div>
</div>
