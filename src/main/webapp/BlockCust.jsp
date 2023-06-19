<%@page import="ShoppingCart.dto.Customer"%>
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
<title>Customer List</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
	<a href="AdminOption.html" class="a1">«Back</a>
	<%
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		Query qu=em.createQuery("select a from Customer a where a.Cstatus='active'");
		List<Customer> cust=qu.getResultList();
		if(cust.size()>0){
	%>
	<div>
	<h3 style="color: antiquewhite;margin-left: 200px;">List of Customer to block</h3>
	<table cellspacing=0 cellpadding=50 class="t1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>email</th>
			<th>status</th>
			<th>Block</th>
		</tr>
		
	<%for(Customer m:cust){ %>
		<tr>
			<td><%= m.getCid() %></td>
			<td><%= m.getCname() %></td>
			<td><%= m.getCemail()%></td>
			<td><%= m.getCstatus()%></td>
			<td><a href="blockcus.jsp?Id=<%=m.getCid()%>" style="color: red">Block</a></td>
		</tr>
	<%} %>
	
	<%}
		else{
			PrintWriter pw=response.getWriter();
			pw.write("No Customer Block");
		}
	%>
	</table>
	
	</div>
	<%
		Query qu1=em.createQuery("select a from Customer a where a.Cstatus='block'");
		List<Customer> cust1=qu1.getResultList();
		if(cust1.size()>0){
	%>
	<div>
	<h3 style="color: antiquewhite;margin-left: 200px;">List of blocked Customer</h3>
	<table cellspacing=0 cellpadding=50 class="t1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>email</th>
			<th>status</th>
			<th>Block</th>
		</tr>
		
	<%for(Customer m1:cust1){ %>
		<tr>
			<td><%= m1.getCid() %></td>
			<td><%= m1.getCname() %></td>
			<td><%= m1.getCemail()%></td>
			<td><%= m1.getCstatus()%></td>
			<td><a href="unblockcus.jsp?Id=<%=m1.getCid()%>" style="color: green">Un-block</a></td>
		</tr>
	<%} %>
	
	<%
		}
		else{
			PrintWriter pw=response.getWriter();
			pw.write("No Customer Unblock");
		}
	%>
	</table>
	</div>
</body>
</html>