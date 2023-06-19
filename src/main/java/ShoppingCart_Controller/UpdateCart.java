package ShoppingCart_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ShoppingCart.dto.Cart;
import ShoppingCart.dto.Customer;
import ShoppingCart.dto.items;

@WebServlet("/updateCart")
public class UpdateCart extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		long qty=Integer.parseInt(req.getParameter("qty"));
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		items item=em.find(items.class, id);
		if(qty>0) {
			item.setItid(id);
			item.setItquantity(qty);
			item.setItname(item.getItname());
			item.setItprice(item.getItprice());
			item.setItcatagory(item.getItcatagory());
		}
		else {
			PrintWriter pw=resp.getWriter();
			pw.write("Please enter valid number");
			RequestDispatcher rd=req.getRequestDispatcher("Cart.jsp");
			rd.include(req, resp);
			resp.setContentType("text/html");
		}
		
		et.begin();
		em.merge(item);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.write("Updated");
		RequestDispatcher rd=req.getRequestDispatcher("Cart.jsp");
		rd.include(req, resp);
		resp.setContentType("text/html");
	}
}
