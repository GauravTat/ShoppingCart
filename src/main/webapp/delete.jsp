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
		
		Merchant merchant=em.find(Merchant.class, id);
		Admin ad=merchant.getAdmin();
		
		List<Merchant> mer=ad.getMerch();
		List<Merchant> newmer=new ArrayList();
		
		for(Merchant m:mer){
			if(m.getMid()!=merchant.getMid()){
				newmer.add(m);
			}
		}
		ad.setMerch(newmer);
		
		et.begin();
		em.merge(ad);
		em.remove(merchant);
		et.commit();
		
		PrintWriter pw=response.getWriter();
		pw.write("Merchant Removed");
		RequestDispatcher rd=request.getRequestDispatcher("RemoveMer.jsp");
		rd.include(request, response);
		response.setContentType("text/html");
	%>
</body>
</html>