<%-- 
    Document   : validate
    Created on : 26.11.2015, 11:45:39
    Author     : Alex
--%>

<%@page import="com.amzi.util.DbUtil"%>
<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DbUtil.getConnection();
        System.out.println("So far so good!");
        PreparedStatement pst = conn.prepareStatement("Select UNAME,PWORD from USER where UNAME=? and PWORD=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())     {      
           out.println("Logged in succesfully."); 
        String site = new String("http://192.168.56.1:8080/WEB-INF/gallery.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location",site);
        }else {
                out.println("Wrong username or password");
            String site2 = new String("http://192.168.56.1:8080/WEB-INF/index.html");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location",site2);
                }
        
      
      
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>
