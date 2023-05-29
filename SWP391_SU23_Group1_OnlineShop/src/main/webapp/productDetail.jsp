<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>
<%
    Product product = (Product) request.getAttribute("product");
    String productThumbnailUrl = product.getThumbnailUrl();
    String productName = product.getName();
    float productPrice = product.getPrice();
    String productDescription = product.getDescription();
    float productPercentDiscount = product.getPercentDiscount();
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
        <div class="py-8 my-3 w-full text-black text-center font-semibold text-2xl" style="background-color: #a8a8a8">SHOPPING PAGE</div>
        <div class="flex flex-1 justify-between">
            <div class="flex flex-col mx-auto">
                <div class="">
                    <img style="max-height: 550px; max-width: 400px" class="object-center" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                </div>

                <div class="flex flex-1 justify-center">
                    <img class="object-cover object-center" width="100" height="125" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    <img class="object-cover object-center" width="100" height="125" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    <img class="object-cover object-center" width="100" height="125" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    <img class="object-cover object-center" width="100" height="125" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                </div>
                <div class="mt-6 flex flex-1 justify-center">
                    <button class="py-2 px-6 rounded-3xl mr-4"style="background-color: black;color: white" >Add to card</button>
                    <button class="py-2 px-6 rounded-3xl mr-4"style="background-color: orange;color: white" >Buy now</button>
                </div>
            </div>
            <div class="flex flex-col w-1/2">
                <h1 class=" text-3xl font-bold mb-6 text-black font-semibold"><%=productName%></h1>
                <div class="flex gap-4">
                    <span><h3 class="text-gray-700 mb-6 font-semibold text-xl" style="color: #FF7315">$<%= productPrice%></h3></span>
                    <span><h3 class="text-gray-700 mb-6 font-semibold text-xl" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                </div>
                <div>
                    <h2 class='font-semibold text-xl'>Description</h2>
                    <p class="text-gray-500 mb-6"><%= productDescription%></p>
                </div>
                <div class='mb-16'>
                    <h2 class='font-semibold text-xl mb-10'>Available Color</h2>
                    <button class="py-1 px-6 rounded-3xl mr-4" style="background-color: #ffe01b;color: black">Yellow</button>
                    <button class="py-1 px-6 rounded-3xl mr-4" style="background-color: black;color: white">Black</button>
                </div>
                <div>
                    <h2 class='font-semibold text-xl mb-10'>Available Size</h2>
                    <button class="py-1 px-8 rounded-3xl mr-8 border-black border-2" >XL</button>
                    <button class="py-1 px-8 rounded-3xl mr-8 border-black border-2" >XXL</button>
                </div>
            </div>
        </div>
        <div class='flex flex-col mx-auto text-center'>
            <div class="font-semibold text-3xl">
                MAYBE YOU <span style="color:#FF7315">WILL LIKE</span>
            </div>
            <div style="color: #6B778D" >
                Product with similarity
            </div>
            <div class="flex flex-1 justify-between mt-4 mx-6 gap-4">
                <div>
                    <div>
                        <img style="max-height: 320px; max-width: 250px" class="object-center" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    </div>
                    <div class='font-normal text-xl'>
                        <%=productName%>
                    </div>
                    <div class="flex gap-4 flex-1 justify-center">
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #FF7315">$<%= productPrice%></h3></span>
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    </div>
                </div>
                <div>
                    <div>
                        <img style="max-height: 320px; max-width: 250px" class="object-center" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    </div>
                    <div class='font-normal text-xl'>
                        <%=productName%>
                    </div>
                    <div class="flex gap-4 flex-1 justify-center">
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #FF7315">$<%= productPrice%></h3></span>
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    </div>
                </div>
                <div>
                    <div>
                        <img style="max-height: 320px; max-width: 250px" class="object-center" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    </div>
                    <div class='font-normal text-xl'>
                        <%=productName%>
                    </div>
                    <div class="flex gap-4 flex-1 justify-center">
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #FF7315">$<%= productPrice%></h3></span>
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    </div>
                </div>
                <div>
                    <div>
                        <img style="max-height: 320px; max-width: 250px" class="object-center" src="<%= productThumbnailUrl%>" alt="Post Thumbnail">
                    </div>
                    <div class='font-normal text-xl'>
                        <%=productName%>
                    </div>
                    <div class="flex gap-4 flex-1 justify-center">
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #FF7315">$<%= productPrice%></h3></span>
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="components/footer.jsp" />
</body>
</html>
