<%@page import="java.io.PrintWriter"%>
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
		
		Product product=em.find(Product.class, id);
		Merchant mer=product.getMerchant();
		
		List<Product> pro=mer.getProduct();
		
		List<Product> newpro=new ArrayList<Product>();
		
		for(Product p:pro){
			if(p.getPid()!=product.getPid()){
				newpro.add(p);
			}
		}
		mer.setProduct(newpro);

		et.begin();
		em.merge(mer);
		em.remove(product);
		et.commit();
		
		PrintWriter pw=response.getWriter();
		pw.write("Product Removed");
		RequestDispatcher rd=request.getRequestDispatcher("DeleteProd.jsp");
		rd.include(request, response);
	%>
</body>
</html>