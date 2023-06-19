<%@page import="ShoppingCart.dto.Admin"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="ShoppingCart.dto.Merchant"%>
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
<title>Product</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
<br><br>
	<a href="AdminOption.html" class="a1">«Back</a>
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	
	Admin ad=(Admin)session.getAttribute("admin");
	List<Merchant> mer=ad.getMerch();
	if(mer.size()>0){
	%>
	
	<table cellspacing=0 cellpadding=40 class="t1">
		<tr>
			<th>id</th>
			<th>Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Stock</th>
		</tr>
		
		<%for(Merchant m:mer){ %>
		<tr>
			<td><%= m.getMid() %></td>
			<td><%= m.getMname()%></td>
			<td><%= m.getMemail()%></td>
			<td><%= m.getMobNo() %></td>
			<td><%= m.getMpassword()%></td>
			<td><%= m.getMstatus()%></td>
		</tr>
		<%} %>
		
	<%}
	else{
		PrintWriter pw=response.getWriter();
		pw.write("No merchant Available to show");
		RequestDispatcher rd=request.getRequestDispatcher("merchantoption.html");
		rd.include(request, response);
		response.setContentType("text/html");
	}
	%>
		</table>
	
</body>
</html>