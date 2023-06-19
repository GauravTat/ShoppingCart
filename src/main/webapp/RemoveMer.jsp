<%@page import="org.w3c.dom.Text"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.Merchant"%>
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
<title>Merchant List</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
	<a href="AdminOption.html" class="a1">«Back</a>
	<%
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		Query qu=em.createQuery("select a from Merchant a where a.Mstatus='active'");
		List<Merchant> merchant=qu.getResultList();
		if(merchant.size()>0){
	%>
	
	<table cellspacing=0 cellpadding=50 class="t1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>email</th>
			<th>status</th>
			<th>Delete</th>
		</tr>
		
	<%for(Merchant m:merchant){ %>
		<tr>
			<td><%= m.getMid() %></td>
			<td><%= m.getMname() %></td>
			<td><%= m.getMemail()%></td>
			<td><%= m.getMstatus()%></td>
			<td><a href="delete.jsp?Id=<%=m.getMid()%>">Delete</a></td>
		</tr>
	<%} %>
	
	<%
		}
		else{
			PrintWriter pw=response.getWriter();
			pw.write("No Merchant to show");
			RequestDispatcher rd=request.getRequestDispatcher("AdminOption.html");
			rd.include(request, response);
			response.setContentType("text/html");
		}
	%>
		
		
		
	</table>
</body>
</html>