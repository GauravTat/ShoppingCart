<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="ShoppingCart.dto.Merchant"%>
<%@page import="javax.persistence.EntityTransaction"%>
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
<title>Update Product</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body>
<a href="merchantoption.html" class="a1">«Back</a>
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	
	Merchant mer=(Merchant)session.getAttribute("merchant");
	List<Product> pro=mer.getProduct();
	if(pro!=null){
	%>
	<table cellspacing=0 cellpadding=50 class="t1">
		<tr>
			<th>Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Stock</th>
			<th>Update</th>
		</tr>
		
	<%for(Product m:pro){ %>
		<tr>
			<td><%= m.getPname() %></td>
			<td><%= m.getPcatagory()%></td>
			<td><%= m.getPprice()%></td>
			<td><%= m.getPStock()%></td>
			<td><a href="Updatelist.jsp?Id=<%=m.getPid()%>" style="color: green">Update</a></td>
		</tr>
	<%} %>
	</table>
	<h2><%}
	else{
		PrintWriter pw=response.getWriter();
		pw.write("No Product to show");
	}
	%></h2>
</body>
</html>