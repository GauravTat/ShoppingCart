<%@page import="ShoppingCart.dto.items"%>
<%@page import="ShoppingCart.dto.Cart"%>
<%@page import="ShoppingCart.dto.Customer"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.mysql.cj.xdevapi.SessionFactory"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ShoppingCart.dto.Merchant"%>
<%@page import="ShoppingCart.dto.Admin"%>
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
<title></title>
</head>
<body>
	<%
		int id=Integer.parseInt(request.getParameter("Id"));//accessed id and converted to int
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Customer cust=em.find(Customer.class, id);
		Cart cart=cust.getCart();
		
		et.begin();
		em.remove(cart);
		em.remove(cust);
		et.commit();
		
		PrintWriter pw=response.getWriter();
		pw.write("Customer Removed");
		RequestDispatcher rd=request.getRequestDispatcher("RemoveCust.jsp");
		rd.include(request, response);
		response.setContentType("text/html");
	%>
</body>
</html>