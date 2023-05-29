
<%@page import="java.sql.Date"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Post"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <link rel="stylesheet" href="styles/css/product.css"/>
        <script src="script/index.js"></script>
        <title>Search</title>
    </head>
    <body>
        <jsp:include page="components/header.jsp" />
        <div class="w-full p-6">
            <div class="p-6 flex flex-1 justify-between" style="align-self: center">
                <div class='font-semibold text-lg'>
                    Product You Have Searched For
                </div>
                <div class="sorting-bar">
                    <label for="sort-select">Sort By:</label>
                    <select id="sort-select" onchange="appendParameter('sortProduct', this.value)">
                        <option value="none">---</option>
                        <option value="created_at~DESC">Sort by Latest Date</option>
                        <option value="created_at~ASC">Sort by Oldest Date</option>
                        <option value="name~ASC">Sort by A-Z</option>
                        <option value="name~DESC">Sort by Z-A</option>
                        <option value="none">Sort by Rating</option>
                        <option value="price~ASC">Sort by Price: Low to High</option>
                        <option value="price~DESC">Sort by Price: High to Low</option>
                    </select>
                </div>

            </div>

            <div class="product-list">
                <%
                    ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");
                    for (int i = 0; i < listProducts.size(); i++) {
                        Product item = listProducts.get(i);
                        int productId = item.getId();
                        String productThumbnailUrl = item.getThumbnailUrl();
                        String productName = item.getName();
                        float productPrice = item.getPrice();
                %>
                <a class="product-card flex items-start flex-col" href="shop?id=<%=productId%>">
                    <img class="product-image" src="<%=productThumbnailUrl%>" alt="<%=productName%>">
                    <h2 class="text-lg font-bold"><%=productName%></h2>
                    <p><%=productPrice%></p>
                </a>
                <%
                    }
                %>


            </div>

            <div class="flex flex-1 justify-end mr-10"> 
                <%
                    int totalPageProduct = (int) request.getAttribute("totalPageProduct");
                    for (int i = 1; i <= totalPageProduct; i++) {
                %>
                <button onclick="appendParameter('page',<%=i%>);" class="px-4 py-2  m-2" style="background:#FF7315; border-radius:8px"><%=i%></button>
                <%
                    }
                %>
            </div>   
        </div>
        <div class="w-full p-6">
            <div class="p-6 flex flex-1 justify-between" style="align-self: center">
                <div class='font-semibold text-lg'>
                    Blog You Have Searched For
                </div>
                <div class="sorting-bar">
                    <label for="sort-select">Sort By:</label>
                    <select id="sort-select" onchange="appendParameter('sortProduct', this.value)">
                        <option value="none">---</option>
                        <option value="created_at~DESC">Sort by Latest Date</option>
                        <option value="created_at~ASC">Sort by Oldest Date</option>
                        <option value="name~ASC">Sort by A-Z</option>
                        <option value="name~DESC">Sort by Z-A</option>
                    </select>
                </div>

            </div>

            <div class="product-list">
                <%
                    ArrayList<Post> listPosts = (ArrayList<Post>) request.getAttribute("listPosts");
                    for (int i = 0; i < listPosts.size(); i++) {
                        Post item = listPosts.get(i);
                        int productId = item.getId();
                        String postThumbnailUrl = item.getThumbnailUrl();
                        String postTitle = item.getTitle();
                        String postShortDescription = item.getShortDescription();
                        Date postCreatedDate = item.getCreatedAt();
                %>
                <div class="bg-white rounded shadow flex flex-col items-start max-w-xl">
                    <div class="w-full max-w-xl">
                        <img class="w-full  h-64 object-cover object-center" src="<%= postThumbnailUrl%>" alt="Post Thumbnail">
                    </div>

                    <div class="w-full p-6 flex flex-col justify-between">
                        <div>
                            <i class="text-gray-700 mb-4 inline-block"><%= postCreatedDate%></i>
                            |
                            <p class="text-gray-700 mb-1 inline-block">3 Comment</p>
                        </div>
                        <div>
                            <h2 class="text-2xl font-bold mb-2 text-red-500"><%=postTitle%></h2>
                            <p class="text-gray-500 mb-4"><%= postShortDescription%></p>
                        </div>

                        <a href="blog?id=<%= productId%>" class="bg-black text-center text-white font-bold py-2 px-4 rounded-full" style="width: 150px">Xem chi tiết</a>

                    </div>
                </div>
                <%
                    }
                %>


            </div>

            <div class="flex flex-1 justify-end mr-10"> 
                <%
                    int totalPagePost = (int) request.getAttribute("totalPagePost");
                    for (int i = 1; i <= totalPagePost; i++) {
                %>
                <button onclick="appendParameter('page',<%=i%>);" class="px-4 py-2  m-2" style="background:#FF7315; border-radius:8px"><%=i%></button>
                <%
                    }
                %>
            </div>   
        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>
