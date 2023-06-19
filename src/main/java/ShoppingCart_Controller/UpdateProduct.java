package ShoppingCart_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import ShoppingCart.dto.Product;

@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value=req.getParameter("value");
		String choice=req.getParameter("choice");
		int id=Integer.parseInt(req.getParameter("id"));
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Product pro=em.find(Product.class, id);
		
		if(choice.equalsIgnoreCase("Name")) {
			pro.setPname(value);
			pro.setPid(pro.getPid());
			pro.setPcatagory(pro.getPcatagory());
			pro.setPprice(pro.getPprice());
			pro.setPStock(pro.getPStock());
		}
		if(choice.equalsIgnoreCase("cat")) {
			pro.setPname(pro.getPname());
			pro.setPid(pro.getPid());
			pro.setPcatagory(value);
			pro.setPprice(pro.getPprice());
			pro.setPStock(pro.getPStock());
		}
		if(choice.equalsIgnoreCase("Price")) {
			double pr=Integer.parseInt(value);
			pro.setPname(pro.getPname());
			pro.setPid(pro.getPid());
			pro.setPcatagory(pro.getPcatagory());
			pro.setPprice(pr);
			pro.setPStock(pro.getPStock());
		}
		if(choice.equalsIgnoreCase("Stock")) {
			long pr=Integer.parseInt(value);
			pro.setPname(pro.getPname());
			pro.setPid(pro.getPid());
			pro.setPcatagory(pro.getPcatagory());
			pro.setPprice(pro.getPprice());
			pro.setPStock(pr);
		}
		
		et.begin();
		em.merge(pro);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.write("Product Updated");
		RequestDispatcher rd=req.getRequestDispatcher("UpdateProd.jsp");
		rd.include(req, resp);
		resp.setContentType("text/html");
	}
}
