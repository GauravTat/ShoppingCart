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
		merchant.setMid(merchant.getMid());
		merchant.setMemail(merchant.getMemail());
		merchant.setMname(merchant.getMname());
		merchant.setMobNo(merchant.getMobNo());
		merchant.setMpassword(merchant.getMpassword());
		merchant.setMstatus("active");//changed status to active
		
		//accessed session
		Admin ad=(Admin)session.getAttribute("admin");//converted session object into admin
		merchant.setAdmin(ad);//set admin to merchant
		
		List<Merchant> merch=ad.getMerch();//accedsed list present inside admin list
		if(merch!=null){
			merch.add(merchant);
		}
		else{
			merch=new ArrayList();//if it null then create new list and insert data
			merch.add(merchant);
		}
		ad.setMerch(merch);//set merchant list to admin
		
		et.begin();
		em.merge(ad);
		em.merge(merchant);
		et.commit();
		
		RequestDispatcher rd=request.getRequestDispatcher("ApproveMer.jsp");
		rd.forward(request, response);
	%>
</body>
</html>