<%@page import="ShoppingCart.dto.Customer"%>
<%@page import="org.w3c.dom.Text"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="ErrorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
	<a href="AdminOption.html" class="a1">Back</a>
	<%
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		Query qu=em.createQuery("select a from Customer a where a.Cstatus='active'");
		List<Customer> cust=qu.getResultList();
		int i=1;
		if(cust.size()>0){
	%>
	
	<table cellspacing=0 cellpadding=50 class="t1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>email</th>
			<th>status</th>
			<th>Delete</th>
		</tr>
		
	<%for(Customer m:cust){ %>
		<tr>
			<td><%=i++ %></td>
			<td><%= m.getCname() %></td>
			<td><%= m.getCemail()%></td>
			<td><%= m.getCstatus()%></td>
			<td><a href="deletecust.jsp?Id=<%=m.getCid()%>">Delete</a></td>
		</tr>
	<%} %>
	
	<%
		}
		else{
			PrintWriter pw=response.getWriter();
			pw.write("No Customer to show");
			RequestDispatcher rd=request.getRequestDispatcher("AdminOption.html");
			rd.include(request, response);
			response.setContentType("text/html");
		}
	%>
		
		
		
	</table>
</body>
</html>