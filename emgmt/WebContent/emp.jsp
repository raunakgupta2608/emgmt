<%@ page import="com.emgmt.gbean" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <jsp:useBean id="ekey" class="com.emgmt.gbean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	gbean g = (gbean) request.getAttribute("ekey");

%>
<br>
your name is <jsp:getProperty property="name" name="ekey"/><br>
your phone is <jsp:getProperty property="phone" name="ekey"/><br>
your department is <jsp:getProperty property="dept" name="ekey"/><br>
your salary is <jsp:getProperty property="salary" name="ekey"/><br>
your email is <jsp:getProperty property="email" name="ekey"/><br>
<br>

<form action ="updatesal.jsp">
Enter new employee<input type="text" name="newemp"><br>
Enter new salary<input type="text" name="newsal"><br>
<input type="submit" name="sub" value="submit">
</form>

</body>
</html>