package ShoppingCart_Controller;

import java.io.IOException;
import java.io.PrintWriter;

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

import ShoppingCart.dto.Cart;
import ShoppingCart.dto.Customer;
import ShoppingCart.dto.Merchant;

@WebServlet("/savedata80")
public class SaveMerchantCustomer extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name1=req.getParameter("name");
		String email1=req.getParameter("email");
		String password1=req.getParameter("password");
		String mobilenumber1=req.getParameter("mobile");
		
		String choice1=req.getParameter("choice");
		
		if(choice1.equals("Create account as merchant"))
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Merchant merchant=new Merchant();
			merchant.setMname(name1);
			merchant.setMemail(email1);
			merchant.setMpassword(password1);
			merchant.setMobNo(Long.parseLong(mobilenumber1));
			merchant.setMstatus("inactive");
			
			et.begin();
			em.persist(merchant);
			et.commit();
			
			PrintWriter pw=resp.getWriter();
			pw.print("Merchant Account created successfully");
			
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.include(req, resp);
			resp.setContentType("text/html");
			
		}
		else
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
			EntityManager em=emf.createEntityManager();
			EntityTransaction et=em.getTransaction();
			
			Customer customer=new Customer();
			customer.setCname(name1);
			customer.setCemail(email1);
			customer.setCpassword(password1);
			customer.setCmobno(Long.parseLong(mobilenumber1));
			customer.setCstatus("active");
			Cart cart=new Cart();
			cart.setCustomer(customer);
			cart.setCatotalprice(0);
			
			customer.setCart(cart);
			
			et.begin();
			em.persist(customer);
			em.persist(cart);
			et.commit();
			
			PrintWriter pw=resp.getWriter();
			pw.print("Customer Account created successfully");
			
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.include(req, resp);
			resp.setContentType("text/html");
		}
	}
}
