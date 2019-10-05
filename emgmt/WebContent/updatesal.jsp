<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page   import="java.sql.*"%>
    <%@ page  import="com.emgmt.DBUtil1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

	Connection con =DBUtil1.getOracleConnection();
	System.out.println(con);
	PreparedStatement pst1 =null;
	PreparedStatement pst2 =null;
	
	String newemp =(String) request.getParameter("newemp");
	String newsal =(String) request.getParameter("newsal");
	out.print(newemp);
	try{
		pst1 = con.prepareStatement("UPDATE  JSP SET SALARY =?  WHERE NAME =?" );
		pst1.setString(1, newsal);
		pst1.setString(2, newemp);
		pst1.executeQuery();
	
		
		pst2 = con.prepareStatement("SELECT * FROM JSP  WHERE NAME =?" );
		pst2.setString(1, newemp);
		ResultSet rs = pst2.executeQuery();
		
		if (rs.next())
		{
			out.println(rs.getString(1)+ "<br>");
			out.println(rs.getString(2)+ "<br>");
			out.println(rs.getString(3)+ "<br>");
			out.println(rs.getString(4)+ "<br>");
			out.println(rs.getString(5)+ "<br>");
			out.println(rs.getString(6)+ "<br>");
		}
	}
	catch(SQLException esql)
	{
		out.println(esql);
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>

</body>
</html>