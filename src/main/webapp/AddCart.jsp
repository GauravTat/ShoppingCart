<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.items"%>
<%@page import="ShoppingCart.dto.Cart"%>
<%@page import="ShoppingCart.dto.Customer"%>
<%@page import="ShoppingCart.dto.Product"%>
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
		
		Product pro=em.find(Product.class, id);
		Customer cust=(Customer)session.getAttribute("customer");
		Cart cart=cust.getCart();
		List<items>it=cart.getItem();
		
		items item=new items();
		item.setCart(cart);
		item.setItname(pro.getPname());
		item.setItcatagory(pro.getPcatagory());
		item.setItprice(pro.getPprice());
		item.setItquantity(1);
		
		if(it.size()>0){
			it.add(item);
		}
		else{
			it=new ArrayList<items>();
			it.add(item);
		}
		cart.setItem(it);
		
		cart.setCatotalprice(cart.getCatotalprice()+pro.getPprice());
	
		et.begin();
		em.persist(item);
		em.merge(cart);
		et.commit();
		
		PrintWriter pw=response.getWriter();
		pw.write("Added to cart");
		RequestDispatcher rd=request.getRequestDispatcher("Custoption.jsp");
		rd.include(request, response);
		response.setContentType("text/html");
	%>
</body>
</html>