
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="styles/tailwindcss/tailwind-all.min.css">
        <title>Shopping</title>
        <style>
            /* Custom styles for the product list */
            .product-list {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 1rem;
                padding: 1rem;
            }

            .product-card {
                padding: 1rem;
                border-radius: 4px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .product-image {
                height: 280px; /* Set a fixed height */
                object-fit: contain;
                width: 280px;


            }

            .product-card h2 {
                font-size: 1.2rem;
                font-weight: bold;
                margin-bottom: 0.5rem;
            }

            .product-card p {
                font-size: 0.9rem;
                color: #555;
            }        </style>
    </head>
    <body>
        <%
              // Retrieve filter values from the query parameters
              String parProductName = request.getParameter("productName");
              if(parProductName!=null && parProductName.isEmpty()){
                parProductName=null;
              }
              String parMinPricePrice = request.getParameter("minPrice");
              if(parMinPricePrice!=null && parMinPricePrice.isEmpty()){
                parMinPricePrice=null;
              }
              String parMaxPricePrice = request.getParameter("maxPrice");
              if(parMaxPricePrice!=null && parMaxPricePrice.isEmpty()){
                parMaxPricePrice=null;
              }
              String parCategoryId = request.getParameter("categoryId");
              if(parCategoryId!=null && parCategoryId.isEmpty()){
                parCategoryId=null;
              }
              System.out.println("parCategoryId "+parCategoryId=="1");
              String parColorId = request.getParameter("colorId");
              if(parColorId!=null && parColorId.isEmpty()){
                parColorId=null;
              }
              String parRating = request.getParameter("rating");          
              if(parRating!=null && parRating.isEmpty()){
                parRating=null;
              }
  
 
        %>
        <jsp:include page="components/header.jsp" />
        <div class="container mx-auto p-6">
            <h1 class="text-3xl font-bold mb-4">Product Filtering</h1>
            <div class="bg-white rounded flex">
                <div class="w-1/3">
                    <form method="get" action="shopping">
                        <div class="mb-4">
                            <label class="block mb-2" for="productName">Product Name:</label>
                            <input type="text" id="productName" name="productName" <%=parProductName != null ? "value="+parProductName : "" %>  class="border border-gray-300 rounded-md py-2 px-4 w-full">
                        </div>

                        <div class="mb-4">
                            <label class="block mb-2" for="minPrice">Min Price:</label>
                            <input type="number" id="minPrice" name="minPrice" <%=parMinPricePrice != null ? "value="+Float.parseFloat(parMinPricePrice) : "" %> " class="border border-gray-300 rounded-md py-2 px-4 w-full">
                        </div>

                        <div class="mb-4">
                            <label class="block mb-2" for="maxPrice">Max Price:</label>
                            <input type="number" id="maxPrice" name="maxPrice" <%=parMaxPricePrice != null ? "value="+Float.parseFloat(parMaxPricePrice) : "" %> " class="border border-gray-300 rounded-md py-2 px-4 w-full">
                        </div>
                        <div class="mb-4">
                            <label class="block mb-2" for="rating">Rating</label>
                            <input type="number" id="rating" name="rating" value="<%=parRating != null ? "value="+Float.parseFloat(parRating) : "" %> " class="border border-gray-300 rounded-md py-2 px-4 w-full">
                        </div>

                        <div class="mb-4">
                            <label class="block mb-2" for="categoryId">Category:</label>
                            <select id="categoryId" name="categoryId" class="border border-gray-300 rounded-md py-2 px-4 w-full">
                                <option value="">All</option>
                                <option value="1" <%= (parCategoryId!= null && Integer.parseInt(parCategoryId)==1) ? "selected" : ""%>>Category 1</option>
                                <option value="2" <%= (parCategoryId!= null && Integer.parseInt(parCategoryId)==2) ? "selected" : ""%>>Category 2</option>
                                <!-- Add more category options as needed -->
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="block mb-2" for="colorId">Color:</label>
                            <select id="colorId" name="colorId" class="border border-gray-300 rounded-md py-2 px-4 w-full">
                                <option value="">All</option>
                                <option value="1" <%= (parColorId!=null && Integer.parseInt(parColorId)==1) ? "selected" : ""%>>Color 1</option>
                                <option value="2" <%=  (parColorId!=null && Integer.parseInt(parColorId)==2) ? "selected" : ""%>>Color 2</option>
                                <!-- Add more color options as needed -->
                            </select>
                        </div>

                        <div class="mt-8">
                            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded-md">Filter</button>
                        </div>
                    </form>
                </div>

                <div class="w-full p-6">

                    <div class="product-list">
                        <%
                                ArrayList<Product> listProducts = (ArrayList<Product>) request.getAttribute("listProducts");
                                for (int i = 0; i < listProducts.size(); i++) {
                                  Product item=  listProducts.get(i);
                                  int productId = item.getId();
                                  String productThumbnailUrl =  item.getThumbnailUrl();
                                  String productName =  item.getName();
                                  float productPrice =  item.getPrice();
                        %>
                        <a class="product-card" href="?id=<%=productId%>">
                            <img class="product-image" src="<%=productThumbnailUrl%>" alt="<%=productName%>">
                            <h2 class="text-lg font-bold"><%=productName%></h2>
                            <p><%=productPrice%></p>
                        </a>
                        <%
                        }
                        %>
                    </div>
                </div>

            </div>


        </div>
        <jsp:include page="components/footer.jsp" />
    </body>
</html>



</body>
</html>
