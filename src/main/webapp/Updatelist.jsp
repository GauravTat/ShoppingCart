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
<title>Update</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
<a href="UpdateProd.jsp" class="a1">Back</a>
	<%
	int id=Integer.parseInt(request.getParameter("Id"));
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	
	Product pro=em.find(Product.class, id);
	if(pro!=null){
	%>
	<div class="d10">
			<p>Name:<%=pro.getPname() %></p>
			<p>Category:<%=pro.getPcatagory() %></p>
			<p>Price:<%=pro.getPprice() %></p>
			<p>Stock:<%= pro.getPStock()%></p>
	</div>
	<div class="d11">
		<p>Select option Data to Update:</p>
		<form action="UpdateProduct" method="post">
			<input type="number" value="<%=pro.getPid()%>" hidden name="id">
			<input type="radio" value="Name" name="choice"><span>Name</span>
			<input type="radio" value="cat" name="choice"><span>Category</span>
			<input type="radio" value="Price" name="choice"><span>Price</span>
			<input type="radio" value="Stock" name="choice"><span>Stock</span>
			<input type="text" name="value" class="i8">
			<input type="submit" value="Change" class="sub5">
		</form>
	</div>
	<h2><%
		}
	else{
		PrintWriter pw=response.getWriter();
		pw.write("No Product to show");
	}
	%></h2>
</body>
</html>