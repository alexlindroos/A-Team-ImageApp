<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=WINDOWS-1252">
<title>Success</title>
</head>
<body>
	<h3><%=request.getAttribute("Message")%></h3>
        <a href="gallery.jsp">Go to gallery</a>
        <img src="http://192.168.56.1:8080/WEB-INF/fileDownload">
        
</body>
</html>