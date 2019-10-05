package com.emgmt;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emgmt.DBUtil1;


public class userdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con=null;
       ResultSet rs;
   
    public userdetails() {  super();  }
    
    public void init() throws ServletException {
    	try {
    		con= DBUtil1.getOracleConnection();
    	} catch(ClassNotFoundException cnfe) {
    		System.out.println(cnfe);
    		
    	}catch(SQLException sqle) {
    		System.out.println(sqle);
    		
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PreparedStatement pst =null;
		String strEmail = request.getParameter("eml");
		String strPassword = request.getParameter("pwd");

		HttpSession session = request.getSession();
		session.setAttribute("strEmail",strEmail);
		session.setAttribute("strPassword",strPassword);
		try
		{
			pst = con.prepareStatement("SELECT NAME,DEPARTMENT FROM JSP WHERE EMAIL=? AND PASSWORD= ?");
			pst.setString(1, strEmail);
			pst.setString(2, strPassword);
			rs=pst.executeQuery();
			if(rs.next()) 
			{
				String dept1= rs.getString("DEPARTMENT");
				String name1= rs.getString("NAME");
				pst = con.prepareStatement("SELECT NAME, PHONE, SALARY,EMAIL, PASSWORD FROM JSP WHERE NAME =?" );
				pst.setString(1, name1);
				rs=pst.executeQuery();
				if(rs.next()) 
				{
					gbean gg= new gbean();
					String name= rs.getString("NAME");
					String phone = rs.getString("PHONE");
					String salary = rs.getString("SALARY");
					String email = rs.getString("EMAIL");
					String password = rs.getString("PASSWORD");

					gg.setName(name);
					gg.setPhone(phone);
					gg.setDepartment(dept1);
					gg.setSalary(salary);
					gg.setEmail(email);
					gg.setPassword(password);
					if(dept1.equals("admin"))
					{
						request.setAttribute("akey", gg);
						RequestDispatcher ad = request.getRequestDispatcher("admin.jsp");
						ad.forward(request, response);
					}
					else
					{
						request.setAttribute("ekey", gg);
						RequestDispatcher ed = request.getRequestDispatcher("emp.jsp");
						ed.forward(request, response);
					}
				}
			}
			else
			{
				RequestDispatcher err = request.getRequestDispatcher("login.html");
				err.forward(request, response);
			}
		}
		catch(SQLException sqle) {
			System.out.println(sqle);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
