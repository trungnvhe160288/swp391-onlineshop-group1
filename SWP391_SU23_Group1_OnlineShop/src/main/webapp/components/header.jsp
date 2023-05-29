<%@page import="com.fptuniversity.swp391_su23_group1_onlineshop.model.User"%>


<%
    User account = (User) request.getSession().getAttribute("account_infomation");
%>
<div class=""flex flex-col-1 font-sans>
    <div class="bg-black text-white font-bold text-lg text-center mb-2">
        <div>Free shipping on Orders Over $50</div>
    </div>
    <div class="flex flex-1 justify-between mx-8">
        <div>
            <a class="font-extrabold text-2xl" href="home">Mon'sa</a>
        </div>
        <div class="flex flex-1 justify-center font-bold text-lg">
            <div class="mx-2">
                <a href="home">
                    HOME
                </a>
            </div >
            <div class="mx-2">
                <a href="shop">
                    SHOP
                </a>
            </div>
            <div class="mx-2">                
                <a href="#">
                    PAGES
                </a>
            </div>
            <div class="mx-2">
                <a href="blog">
                    BLOG
                </a>
            </div>
        </div>
        <div>
            <div class="inline-block">
                <form class="flex justify-center items-center" action="search" method="POST">
                    <div class="inline-block mx-4">
                        <input type="text" placeholder="Search" name="keySearch"  id="keySearch" class="px-4 py-2 rounded-l-lg border border-gray-300 focus:outline-none focus:ring focus:ring-blue-400" />
                        <button type="submit" class="bg-gray-500 text-white px-4 py-2 rounded-r-lg">Search</button>
                    </div>
                </form>
            </div>


            <%
                if (account != null) {
            %>
            <h2 class="inline-block">Hello <a href="userProfile"> <b><%=account.getFullname()%></b> </a></h2>
            |
            <form class="inline-block" action="logout" method="POST">
                <button type="submit">
                    Logout
                </button>
            </form>
            <%
            } else {
            %>
            <a href="login" class='font-bold px-6 py-1 border mr-2' style="border-color: black; border-radius: 10px">
                Login
            </a>
            <a href="register" class='font-bold px-6 py-1 border' style="border-color: black; border-radius: 10px">
                Register
            </a>
            <%
                }
            %>


        </div>
    </div>
</div>