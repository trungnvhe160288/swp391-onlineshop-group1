<%-- 
    Document   : userprofile
    Created on : May 25, 2023, 4:15:12 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <h1>User Profile</h1>
    
    <%-- Fetch user details from the server or database --%>
    <% 
        String userName = "JohnDoe"; // Example username
        String fullName = "John Doe"; // Example full name
        String phone = "123-456-7890"; // Example phone number
        String address = "123 Main St, City, Country"; // Example address
        String email = "johndoe@example.com"; // Example email
    %>
    
    <table>
        <tr>
            <th>Username:</th>
            <td><%= userName %></td>
        </tr>
        <tr>
            <th>Full Name:</th>
            <td><%= fullName %></td>
        </tr>
        <tr>
            <th>Phone:</th>
            <td><%= phone %></td>
        </tr>
        <tr>
            <th>Address:</th>
            <td><%= address %></td>
        </tr>
        <tr>
            <th>Email:</th>
            <td><%= email %></td>
        </tr>
    </table>
</body>
</html>
