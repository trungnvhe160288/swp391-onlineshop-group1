<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>
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
        <%
            Product newProduct = (Product) request.getAttribute("newProduct");
            ArrayList<Product> featuredProducts = (ArrayList<Product>) request.getAttribute("featuredProducts");
            ArrayList<Post> lastestPosts = (ArrayList<Post>) request.getAttribute("lastestPosts");
        %>
        <div class="mt-64">
            <div class="flex flex-1 justify-between relative" style="background-color: #F1FAFF; height: 300px">
                <div class="ml-32 mt-10">
                    <div class=" font-bold text-4xl ">Discover & Shop <br>The Trend Ss19</div>
                    <div class="">EXTRA 55% OFF IN SPRING SALE</div>
                    <div class="mt-6">
                        <a href="shope" class="px-4 py-2 text-white mt-3" style="background: #030712; border-radius: 8px;" >Shopping now</a>
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
                <div class="font-normal text-xl ">#<%=newProduct.getId()%></div>
                <div class="font-bold text-2xl ">Available on Store</div>
                <div class="mt-6">
                    <a href="shop?id=<%=newProduct.getId()%>" class="px-5 py-2 mt-6 border-2 font-semibold" style="border-radius: 8px;border-color: black" >Shipping now</a>
                </div>
            </div>
            <div>
                <img  src="<%=newProduct.getThumbnailUrl()%>" alt="alt" width="400" height="400"/>
            </div>
        </div>
        <div class="flex flex-col justify-between">
            <div class="font-bold text-4xl underline text-center my-8">Featured Product</div>
            <div class="flex flex-1 justify-evenly">
                <%
                    for (int i = 0; i < featuredProducts.size(); i++) {
                        Product item = featuredProducts.get(i);
                        String percentDiscount = (item.getPercentDiscount() * 100) + "%";
                %>
                <div>
                    <div class="block flex flex-1 justify-center relative ">
                        <div>
                            <img  src="<%=item.getThumbnailUrl()%>"   style="width: 280px;height: 320px;  object-fit: cover;" alt="alt"/>
                        </div>
                        <a href="shop?id=<%=item.getId()%>" class="absolute border-2 px-4 py-2 bottom-10 text-black bg-white rounded-xl">SHOP NOW</a>
                    </div>
                    <div class="flex flex-col text-center font-semibold">
                        <div><%=item.getName()%></div>
                        <div>sale <%=percentDiscount%> off</div>
                        <div>-DON"T MISS-</div>
                    </div>
                </div>
                <%
                    }
                %>


            </div>
        </div>
        <div class="flex flex-col justify-between">
            <div class="font-bold text-4xl underline text-center my-8">Featured News</div>
            <div class="flex flex-1 justify-evenly">
                <%
                    for (int i = 0; i < lastestPosts.size(); i++) {
                        Post item = lastestPosts.get(i);

                %>
                <div class="flex flex-col">
                    <img  src="<%=item.getThumbnailUrl()%>" alt="alt"/>
                    <div class="flex flex-col text-center font-semibold"><%=item.getTitle()%></div>
                    <a href="blog?id=<%=item.getId()%>">
                        <img   class="mx-auto"src="./assets//images/arrow-icon.png" alt="alt" height="50" width="50"/>
                    </a>

                </div>
                <%
                    }
                %>


            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
