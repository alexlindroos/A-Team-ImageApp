<%-- 
    Document   : register
    Created on : 26.11.2015, 12:04:40
    Author     : Alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
   
    <body>
        <form action ="reg" method="post"/>
        <table>
            <tr>
                <th> ID </th>
                <td><input type="text" name="user_id" /></td>
            </tr>
            <tr>
                <th> First Name </th>
                <td><input type="text" name="first_name" /></td>
            </tr>
            <tr>
                <th> Last Name </th>
                <td><input type="text" name="last_name" /></td>
            </tr>
            <tr>
                <th> Email </th>
                <td><input type="text" name="user_email" /></td>
            </tr>
            <tr>
                <th> Username </th>
                <td><input type="text" name="user_name" /></td>
            </tr>
            <tr>
                <th> Password </th>
                <td><input type="text" name="user_password" /></td>
            </tr>
            <th></th>
            <td><input type="submit" value="Register"/></td>
        </table>
    </body>
</html>
