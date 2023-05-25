<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <title>Home Page</title>
    </head>
    <body class="w-full h-screen flex flex-col  ">
        <jsp:include page="components/header.jsp" />
        <div class="mt-64">
            <div class="flex flex-1 justify-between relative" style="background-color: #F1FAFF; height: 300px">
                <div class="ml-32 mt-10">
                    <div class=" font-bold text-4xl ">Discover & Shop <br>The Trend Ss19</div>
                    <div class="">EXTRA 55% OFF IN SPRING SALE</div>
                    <div>
                        <button class="px-4 py-2 text-white mt-3" style="background: #030712; border-radius: 8px;" >Shopping now</button>
                    </div>
                </div>
                <div class="absolute  bottom-0 right-0">
                    <img  src="./assets/images/jumbotop.png" alt="alt" width="400" height="500"/>
                </div>
            </div>
        </div>
        <div class="flex flex-1 justify-evenly mx-20 " style="margin-top: 135px" >
            <div class="flex flex-col ">
                <div class="font-bold text-3xl underline text-center">New Collection</div>
                <div class="font-normal text-xl ">#35</div>
                <div class="font-bold text-2xl ">Available on Store</div>
                <div>
                    <button class="px-5 py-2 mt-3 border-2 font-semibold" style="border-radius: 8px;border-color: black" >Shipping now</button>
                </div>
            </div>
            <div>
                <img  src="./assets/images/section2-homepage.png" alt="alt" width="400" height="400"/>
            </div>
        </div>
        <div class="flex flex-col justify-between">
            <div class="font-bold text-4xl underline text-center my-8">Featured Product</div>
            <div class="flex flex-1 justify-evenly">
                <div>
                    <div class="block flex flex-1 justify-center relative ">
                        <div class="">
                            <img  src="./assets//images/sale-1.png" alt="alt"/>
                        </div>
                        <button class="absolute border-2 px-4 py-2 bottom-10 text-black bg-white rounded-xl">SHOP NOW</button>
                    </div>
                    <div class="flex flex-col text-center font-semibold">
                        <div>MAN OUTWEAR</div>
                        <div>sale 40% off</div>
                        <div>-DON"T MISS-</div>
                    </div>
                </div>
                <div>
                    <div class="block flex flex-1 justify-center relative ">
                        <div class="">
                            <img  src="./assets//images/sale-1.png" alt="alt"/>
                        </div>
                        <button class="absolute border-2 px-4 py-2 bottom-10 text-black bg-white rounded-xl">SHOP NOW</button>
                    </div>
                    <div class="flex flex-col text-center font-semibold">
                        <div>MAN OUTWEAR</div>
                        <div>sale 40% off</div>
                        <div>-DON"T MISS-</div>
                    </div>
                </div>
                <div>
                    <div class="block flex flex-1 justify-center relative ">
                        <div class="">
                            <img  src="./assets//images/sale-1.png" alt="alt"/>
                        </div>
                        <button class="absolute border-2 px-4 py-2 bottom-10 text-black bg-white rounded-xl">SHOP NOW</button>
                    </div>
                    <div class="flex flex-col text-center font-semibold">
                        <div>MAN OUTWEAR</div>
                        <div>sale 40% off</div>
                        <div>-DON"T MISS-</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-col justify-between">
            <div class="font-bold text-4xl underline text-center my-8">Featured News</div>
            <div class="flex flex-1 justify-evenly">
                <div class="flex flex-col">
                    <img  src="./assets//images/news-2.png" alt="alt"/>
                    <div class="flex flex-col text-center font-semibold">Seasonal Trends</div>
                    <img   class="mx-auto"src="./assets//images/arrow-icon.png" alt="alt" height="50" width="50"/>
                </div>
                <div class="flex flex-col">
                    <img  src="./assets//images/news-1.png" alt="alt"/>
                    <div class="flex flex-col text-center font-semibold">Seasonal Trends</div>
                    <img   class="mx-auto"src="./assets//images/arrow-icon.png" alt="alt" height="50" width="50"/>
                </div>
            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
