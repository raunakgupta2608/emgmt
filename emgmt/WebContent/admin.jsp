<%@ page import="com.emgmt.gbean"  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <jsp:useBean id="akey " class="com.emgmt.gbean" scope="session"/>
                    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	gbean g = (gbean) request.getAttribute("akey");

	String email=request.getParameter("eml");
	String password=request.getParameter("pwd");
	out.print(email);
	/*String str =(String) session.getAttribute("strEmail");
	if()
	
	
	Connection con=null;
	PreparedStatement pst = null;*/
	
	
%>
<input type="button" value="update salary" >
<input type="button" value="delete" >
<br>
your name is <jsp:getProperty property="name" name="akey"/><br>
your phone is <jsp:getProperty property="phone" name="akey"/><br>
your department is <jsp:getProperty property="dept" name="akey"/><br>
your salary is <jsp:getProperty property="salary" name="akey"/><br>
your email is <jsp:getProperty property="email" name="akey"/><br>
<%

 String com= (String) session.getAttribute("company");

%>
<%=com %>

</body>
</html>