<%@page import="ShoppingCart.dto.items"%>
<%@page import="ShoppingCart.dto.Cart"%>
<%@page import="ShoppingCart.dto.Customer"%>
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
<title>Cart</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgrey;">
	<a href="Custoption.jsp" class="a1">Back</a>
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	
	Customer cust=(Customer)session.getAttribute("customer");
	Cart cart=cust.getCart();
	List<items> it=cart.getItem();
	
	if(it.size()>0){
	%>
	
	<table cellspacing=0 cellpadding=40 border=1 class="t1">
		<tr>
			<th>Name</th>
			<th>Category</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Update Quantity</th>
			<th>Delete</th>
		</tr>
		
		<%for(items i:it){ %>
		<tr>
			<td><%= i.getItname()%></td>
			<td><%=i.getItcatagory()%></td>
			<td><%= i.getItprice() %></td>
			<td><%= i.getItquantity() %></td>
			<td><form action="updateCart" method="post">
				<input type="number" value="<%=i.getItid()%>" hidden name="id">
				<input type="number" placeholder="Quantity" name="qty" class="i6">
				<input type="submit" class="sub3">
				</form>
			</td>
			<td><a href="deleteCart.jsp?Id=<%=i.getItid()%>">Delete</a></td>
		</tr>
		<div class="div1">
			<h2>Total Cart Value:<%=cart.getCatotalprice() %></h2>
		</div>
		<%} %>
		
	
		</table>
	<h3><%}
	else{
		PrintWriter pw=response.getWriter();
		pw.write("No Product is Available");
	}
	%></h3>
</body>
</html>