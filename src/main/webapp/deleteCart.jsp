<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ShoppingCart.dto.Cart"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ShoppingCart.dto.items"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
	int id=Integer.parseInt(request.getParameter("Id"));
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	items item=em.find(items.class, id);
	Cart cart=item.getCart();
	cart.setCatotalprice(cart.getCatotalprice()-item.getItprice());
	
	List<items> it=cart.getItem();
	List<items> newit=new ArrayList();
	for(items i:it){
		if(item.getItid()!=i.getItid()){
			newit.add(i);
		}
	}
	cart.setItem(newit);
	cart.setCatotalprice(cart.getCatotalprice()-item.getItprice());
	
	et.begin();
	em.remove(item);
	em.merge(cart);
	et.commit();
	
	PrintWriter pw=response.getWriter();
	pw.write("Item Removed");
	RequestDispatcher rd=request.getRequestDispatcher("Cart.jsp");
	rd.include(request, response);
	response.setContentType("text/html");
	%>
</body>
</html>