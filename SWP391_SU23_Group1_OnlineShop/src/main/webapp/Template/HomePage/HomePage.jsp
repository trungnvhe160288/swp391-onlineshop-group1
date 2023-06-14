<%-- 
    Document   : HomePage
    Created on : May 18, 2023, 4:31:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="homepagestyle.css" />
        <title>Web Design Mastery | Mon'sa</title>
    </head>
    <body>
        <div class="header__bar">Free Shipping on Orders Over $50</div>
        <nav class="section__container nav__container">
            <a href="#" class="nav__logo">
                <img src="../../assets/images/logo.png" alt="Mon'sa Logo"/>
            </a>
            <ul class="nav__links">
                <li class="link"><a href="#">HOME</a></li>
                <li class="link"><a href="#">SHOP</a></li>
                <li class="link"><a href="#">PAGES</a></li>
                <li class="link"><a href="#">BLOG</a></li>
                <!-- <li class="link"><a href="#">LOOKBOOK</a></li> -->
            </ul>
            <div class="nav__icons">
                <span><i class="ri-shield-user-line"></i></span>
                <span><i class="ri-search-line"></i></span>
                <span><i class="ri-shopping-bag-2-line"></i></span>
            </div>
        </nav>

        <header>
            <div class="section__container header__container">
                <div class="header__content">
                    <p>EXTRA 55% OFF IN SPRING SALE</p>
                    <h1>Discover & Shop<br />The Trend Ss19</h1>
                    <button class="btn">SHOP NOW</button>
                </div>
                <div class="header__image">
                    <img src="assets/header.png" alt="header" />
                </div>
            </div>
        </header>

        <section class="section__container collection__container">
            <img src="assets/collection.jpg" alt="collection" />
            <div class="collection__content">
                <h2 class="section__title">New Collection</h2>
                <p>#35 ITEMS</p>
                <h4>Available on Store</h4>
                <button class="btn">SHOP NOW</button>
            </div>
        </section>

        <section class="section__container sale__container">
            <h2 class="section__title">On Sale</h2>
            <div class="sale__grid">
                <div class="sale__card">
                    <img src="assets/sale-1.jpg" alt="sale" />
                    <div class="sale__content">
                        <p class="sale__subtitle">MAN OUTERWEAR</p>
                        <h4 class="sale__title">sale <span>40%</span> off</h4>
                        <p class="sale__subtitle">- DON'T MISS -</p>
                        <button class="btn sale__btn">SHOP NOW</button>
                    </div>
                </div>
                <div class="sale__card">
                    <img src="assets/sale-2.jpg" alt="sale" />
                    <div class="sale__content">
                        <p class="sale__subtitle">WOMAN T-SHIRT</p>
                        <h4 class="sale__title">sale <span>25%</span> off</h4>
                        <p class="sale__subtitle">- DON'T MISS -</p>
                        <button class="btn sale__btn">SHOP NOW</button>
                    </div>
                </div>
                <div class="sale__card">
                    <img src="assets/sale-3.jpg" alt="sale" />
                    <div class="sale__content">
                        <p class="sale__subtitle">JACKETS</p>
                        <h4 class="sale__title">sale <span>20%</span> off</h4>
                        <p class="sale__subtitle">- DON'T MISS -</p>
                        <button class="btn sale__btn">SHOP NOW</button>
                    </div>
                </div>
            </div>
        </section>

        <section class="section__container musthave__container">
            <h2 class="section__title">Must Have</h2>
            <div class="musthave__nav">
                <a href="#">ALL</a>
                <a href="#">MAN</a>
                <a href="#">WOMEN</a>
                <a href="#">BAG</a>
                <a href="#">SHOES</a>
            </div>
            <div class="musthave__grid">
                <div class="musthave__card">
                    <img src="assets/musthave-1.png" alt="must have" />
                    <h4>Basic long sleeve T-shirt</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <div class="musthave__card">
                    <img src="assets/musthave-2.png" alt="must have" />
                    <h4>Ribbed T-shirt with buttons</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <div class="musthave__card">
                    <img src="assets/musthave-3.png" alt="must have" />
                    <h4>Jacket withside strips</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <!-- <div class="musthave__card">
                  <img src="assets/musthave-4.png" alt="must have" />
                  <h4>High-heel tubular sandals</h4>
                  <p><del>$45.00</del> $75.00</p>
                </div>
                <div class="musthave__card">
                  <img src="assets/musthave-5.png" alt="must have" />
                  <h4>Coral fabric belt bag</h4>
                  <p><del>$45.00</del> $75.00</p>
                </div> -->
                <div class="musthave__card">
                    <img src="assets/musthave-6.png" alt="must have" />
                    <h4>Piggy skater slogan T-shirt</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <!-- <div class="musthave__card">
                  <img src="assets/musthave-7.png" alt="must have" />
                  <h4>White platform boots</h4>
                  <p><del>$45.00</del> $75.00</p>
                </div> -->
                <div class="musthave__card">
                    <img src="assets/musthave-8.png" alt="must have" />
                    <h4>Sweater vest with sleeves</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <div class="musthave__card">
                    <img src="assets/musthave-9.png" alt="must have" />
                    <h4>Slim fit pants</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <!-- <div class="musthave__card">
                  <img src="assets/musthave-10.png" alt="must have" />
                  <h4>Gray backpack</h4>
                  <p><del>$45.00</del> $75.00</p>
                </div> -->
                <div class="musthave__card">
                    <img src="assets/musthave-11.png" alt="must have" />
                    <h4>Neon sweatshirt</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
                <div class="musthave__card">
                    <img src="assets/musthave-12.png" alt="must have" />
                    <h4>Hooded nautical jacket</h4>
                    <p><del>$45.00</del> $75.00</p>
                </div>
            </div>
        </section>

        <section class="news">
            <div class="section__container news__container">
                <h2 class="section__title">Latest News</h2>
                <div class="news__grid">
                    <div class="news__card">
                        <img src="assets/news-1.jpg" alt="news" />
                        <div class="news__details">
                            <p>
                                FASHION <i class="ri-checkbox-blank-circle-fill"></i>
                                <span>JAMES SIMSON</span>
                                <i class="ri-checkbox-blank-circle-fill"></i> FEB 2, 2019
                            </p>
                            <h4>Seasonal Trends</h4>
                            <hr />
                            <p>
                                Discuss the latest fashion trends for the current season and
                                offer tips and ideas on how to incorporate these trends into
                                your wardrobe.
                            </p>
                            <a href="#"><i class="ri-arrow-right-line"></i></a>
                        </div>
                    </div>
                    <div class="news__card">
                        <img src="assets/news-2.jpg" alt="news" />
                        <div class="news__details">
                            <p>
                                TRENDS <i class="ri-checkbox-blank-circle-fill"></i>
                                <span>JAMES SIMSON</span>
                                <i class="ri-checkbox-blank-circle-fill"></i> APR 15, 2019
                            </p>
                            <h4>Fashion Tips and Advice</h4>
                            <hr />
                            <p>
                                Provide your readers with practical tips and advice on how to
                                dress for different occasions, body types, or style preferences.
                            </p>
                            <a href="#"><i class="ri-arrow-right-line"></i></a>
                        </div>
                    </div>
                    <!-- <div class="news__card">
                      <img src="assets/news-3.jpg" alt="news" />
                      <div class="news__details">
                        <p>
                          STYLE <i class="ri-checkbox-blank-circle-fill"></i>
                          <span>JAMES SIMSON</span>
                          <i class="ri-checkbox-blank-circle-fill"></i> JUL 22, 2019
                        </p>
                        <h4>Sustainable Fashion</h4>
                        <hr />
                        <p>
                          Cover the growing trend of eco-conscious fashion and explore the
                          various ways to be sustainable in your fashion choices.
                        </p>
                        <a href="#"><i class="ri-arrow-right-line"></i></a>
                      </div>
                    </div> -->
                </div>
            </div>
        </section>

        <section class="section__container brands__container">
            <div class="brand__image">
                <img src="assets/brand-1.png" alt="brand" />
            </div>
            <div class="brand__image">
                <img src="assets/brand-2.png" alt="brand" />
            </div>
            <div class="brand__image">
                <img src="assets/brand-3.png" alt="brand" />
            </div>
            <div class="brand__image">
                <img src="assets/brand-4.png" alt="brand" />
            </div>
            <div class="brand__image">
                <img src="assets/brand-5.png" alt="brand" />
            </div>
            <div class="brand__image">
                <img src="assets/brand-6.png" alt="brand" />
            </div>
        </section>

        <hr />

        <footer class="section__container footer__container">
            <div class="footer__col">
                <h4 class="footer__heading">CONTACT INFO</h4>
                <p>
                    <i class="ri-map-pin-2-fill"></i> 123, London Bridge Street, London
                </p>
                <p><i class="ri-mail-fill"></i> support@monsa.com</p>
                <p><i class="ri-phone-fill"></i> (+012) 3456 789</p>
            </div>
            <div class="footer__col">
                <h4 class="footer__heading">COMPANY</h4>
                <p>Home</p>
                <p>About Us</p>
                <p>Work With Us</p>
                <p>Our Blog</p>
                <p>Terms & Conditions</p>
            </div>
            <div class="footer__col">
                <h4 class="footer__heading">USEFUL LINK</h4>
                <p>Help</p>
                <p>Track My Order</p>
                <p>Men</p>
                <p>Women</p>
                <p>Shoes</p>
            </div>

        </footer>

        <hr />

        <div class="section__container footer__bar">
            <div class="copyright">
                Copyright © 2023 Web Design Mastery. All rights reserved.
            </div>
            <div class="footer__form">
                <form>
                    <input type="text" placeholder="ENTER YOUR EMAIL" />
                    <button class="btn" type="submit">SUBSCRIBE</button>
                </form>
            </div>
        </div>
    </body>
</html>

