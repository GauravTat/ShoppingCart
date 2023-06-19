<%@page import="ShoppingCart.dto.Customer"%>
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
    <%@ page errorPage="ErrorPage.jsp" %>
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
		cust.setCid(cust.getCid());
		cust.setCemail(cust.getCemail());
		cust.setCmobno(cust.getCmobno());
		cust.setCname(cust.getCname());
		cust.setCpassword(cust.getCpassword());
		cust.setCstatus("active");//changed status to active
		
		et.begin();
		em.merge(cust);
		et.commit();
		
		
		RequestDispatcher rd=request.getRequestDispatcher("BlockCust.jsp");
		rd.forward(request, response);
	%>
</body>
</html>