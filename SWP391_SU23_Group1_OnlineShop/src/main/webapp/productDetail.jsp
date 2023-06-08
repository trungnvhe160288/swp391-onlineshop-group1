<%@page import="java.text.DecimalFormat"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Feedback"%>
<%@page import="java.util.ArrayList"%>
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

                    <%
                        if (productPercentDiscount != 0) {

                            float newPrice = productPrice * (1 - productPercentDiscount);
                    %>
                    <span><h3 class="text-gray-700 mb-6 font-semibold text-xl" style="color: #FF7315">$<%= newPrice%></h3></span>
                    <span><h3 class="text-gray-700 mb-6 font-semibold text-xl" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    <%
                    } else {
                    %>
                    <span><h3 class="text-gray-700 mb-6 font-semibold text-xl" style="color: #FF7315">$<%= productPrice%></h3></span>
                    <%
                        }
                    %>

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
        <div class="m-12 px-8 py-4" style="background: #D9D9D9">
            <div class='font-semibold text-xl '>CUSTOMER FEED BACK</div>
            <!--            map comment here-->
            <div class='flex flex-col justify-between my-3' >

                <%
                    ArrayList<Feedback> feedbackLists = (ArrayList<Feedback>) request.getAttribute("feedbackLists");
                    for (int i = 0; i < feedbackLists.size(); i++) {
                        Feedback feedback = feedbackLists.get(i);
                %>
                <hr class="h-px my-8 bg-gray-200 border-0 dark:bg-gray-700">
                <div class="flex flex-col justify-between ">
                    <div  class="flex flex-row ">
                        <h2 class="font-bold text-lg flex justify-center items-center">
                            Rating: <%= feedback.getRating()%>/5
                        </h2>
                        <p class="ml-10 flex justify-center items-center">
                            <%= feedback.getContent()%>
                        </p>
                    </div>
                    <p class="mt-4">
                        By <%= feedback.getAuthorName()%> on <%= feedback.getCreatedAt()%>
                    </p>
                </div>

                <%
                    }
                %>
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
                <%
                    ArrayList<Product> productSuggestions = (ArrayList<Product>) request.getAttribute("productSuggestions");
                    for (int i = 0; i < productSuggestions.size(); i++) {
                        Product item = productSuggestions.get(i);
                        int itemProductId = item.getId();
                        String itemProductThumbnailUrl = item.getThumbnailUrl();
                        String itemProductName = item.getName();
                        float itemProductPrice = item.getPrice();
                %>
                <a href="?id=<%=itemProductId%>">
                    <div>

                        <img style="max-height: 320px; max-width: 250px" class="object-center" src="<%= itemProductThumbnailUrl%>" alt="Post Thumbnail"/>
                    </div>
                    <div class='font-normal text-xl'>
                        <%=itemProductName%>
                    </div>
                    <div class="flex gap-4 flex-1 justify-center">
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #FF7315">$<%= itemProductPrice%></h3></span>
                        <span><h3 class="text-gray-700 mb-6 font-normal text-lg" style="color: #6B778D; text-decoration: line-through;">$<%= productPrice%></h3></span>
                    </div>
                </a>
                <%
                    }
                %>



            </div>
        </div>
    </div>
    <jsp:include page="components/footer.jsp" />
</body>
</html>
