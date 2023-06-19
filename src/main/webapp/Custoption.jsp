<%@page import="ShoppingCart.dto.Customer"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
<link rel="stylesheet" href="CSSFile.css">
</head>
<body style="background-color: darkgray;">
	<%
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Customer cust=(Customer)session.getAttribute("customer");
	
	%>
	<div class="d3">
		<h1 style="color: antiquewhite;margin-left: 8px;">Welcome <%=cust.getCname() %></h1>
		<a href="Logout.jsp" class="l3">Logout</a>
		<a href="Cart.jsp" class="l4">View Cart</a>
	</div>
	<div class="d4">
		<form action="Custoption.jsp">
			<span class="s2">Search by product name</span><input type="text" name="proname" placeholder="Product Name" autocomplete="off" class="i5">
			<span class="s2">Search by Category</span><input type="text" name="catname" placeholder="Catogory" autocomplete="off" class="i5">
			<input type="submit" value="Search" class="sub2">
			</form>
	</div>
	<%
	String proname=request.getParameter("proname");
	String cat=request.getParameter("catname");
	
	int c=0,c1=0;
	if(proname!=null && proname!=""){
		Query qu=em.createQuery("select a from Product a where a.Pname=?1");
		qu.setParameter(1, proname);
		List<Product> p1=qu.getResultList();
		if(p1.size()>0){
			for(Product p:p1){
	%>
		<div class="d5"><br><br>
			<span class="s1">Name of Product:</span class="s1"><span> <%=p.getPname() %></span><br>
			<span class="s1">Catagory:</span><span class="s1"> <%=p.getPcatagory() %></span><br>
			<span class="s1">Price:</span><span class="s1"> <%=p.getPprice() %></span><br>
			<span class="s1">Add to cart:</span><span  class="s1"><a href="AddCart.jsp?Id=<%=p.getPid()%>">Click</a></span><br><br>
		</div>
		<%	}
		}
		else if(c++==1 || p1.size()==0){
			out.println("No Result Found");
		}
		%>
	<%
	}
	if(cat!=null && cat!=""){
		Query qu1=em.createQuery("select a from Product a where a.Pcatagory=?1");
		qu1.setParameter(1, cat);
		List<Product> p2=qu1.getResultList();
		if(p2.size()>0){
			for(Product p3:p2){
	%>
	<div class="d5"><br><br>
			<span class="s1">Name of Product:</span><span class="s1"><%=p3.getPname() %></span><br>
			<span class="s1">Catagory:</span><span class="s1"><%=p3.getPcatagory() %></span><br>
			<span class="s1">Price:</span><span class="s1"><%=p3.getPprice() %></span><br>
			<span class="s1">Add to cart:</span><span class="s1"><a href="AddCart.jsp?Id=<%=p3.getPid()%>">Click</a></span><br>
		</div>
		
		<%	}
			}
	else if(c1++==1 || p2.size()==0){
			out.println("No Result Found");
		}}
		%>
</body>
</html>