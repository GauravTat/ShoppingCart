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
<br>
	<a href="merchantoption.html" class="a1">«Back</a>
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	
	Merchant mer=(Merchant)session.getAttribute("merchant");
	List<Product> pro=mer.getProduct();
	if(pro.size()>0){
	%>
	<h1 style="color: rgb(66, 60, 52);margin-left: 400px;">Product List</h1>
	<table cellspacing=0 cellpadding=40  class="t1">
		<tr>
			<th>id</th>
			<th>Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Stock</th>
		</tr>
		
		<%for(Product p:pro){ %>
		<tr>
			<td><%= p.getPid() %></td>
			<td><%= p.getPname()%></td>
			<td><%= p.getPcatagory()%></td>
			<td><%= p.getPprice() %></td>
			<td><%= p.getPStock()%></td>
		</tr>
		<%} %>
		
	<%}
	else{
		PrintWriter pw=response.getWriter();
		pw.write("No Product Available to show");
		RequestDispatcher rd=request.getRequestDispatcher("merchantoption.html");
		rd.include(request, response);
		response.setContentType("text/html");
	}
	%>
		</table>
	
</body>
</html>