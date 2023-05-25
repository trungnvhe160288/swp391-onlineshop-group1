<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>
<%
       Product product = (Product) request.getAttribute("product");
       String productThumbnailUrl =  product.getThumbnailUrl();
       String productName =  product.getName();
       float productPrice =  product.getPrice();
       String productDescription =  product.getDescription();
       float productPercentDiscount =  product.getPercentDiscount();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <title><%=productName%></title>

    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <div class="container mx-auto py-6 px-6">
            <div class="bg-white rounded  flex">
                <div class="w-1/3">
                    <img class="h-full h-64 object-cover object-center" src="<%= productThumbnailUrl %>" alt="Post Thumbnail">
                </div>

                <div class="w-full p-6 flex flex-col justify-between">

                    <h1 class=" text-2xl font-bold mb-2 text-red-500"><%=productName %></h1>
                    <h3 class="text-gray-700 mb-1">$<%= productPrice %></h3>
                    <div>
                        <h2>Mô tả</h2>
                        <p class="text-gray-500 mb-4"><%= productDescription %></p>
                    </div>
                    <div>
                        <h2>Màu</h2>
                        <button class="py-2 px-6 rounded-3xl mr-4" style="background-color: yellow;color: black">Yellow</button>
                        <button class="py-2 px-6 rounded-3xl mr-4" style="background-color: black;color: white">Black</button>
                    </div>
                    <div>
                        <h2>Size</h2>
                        <button class="py-2 px-6 rounded-3xl mr-4 border-black border-2" >XL</button>
                        <button class="py-2 px-6 rounded-3xl mr-4 border-black border-2" >XXL</button>
                    </div>

                </div>

            </div>
            <div class="mt-6">
                <button class="py-2 px-6 rounded-3xl mr-4"style="background-color: black;color: white" >Add to card</button>
                <button class="py-2 px-6 rounded-3xl mr-4"style="background-color: orange;color: white" >Buy now</button>
            </div>
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
