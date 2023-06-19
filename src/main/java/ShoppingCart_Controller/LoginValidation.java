package ShoppingCart_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ShoppingCart.dto.Admin;
import ShoppingCart.dto.Customer;
import ShoppingCart.dto.Merchant;
import ShoppingCart.dto.items;
@WebServlet("/validatelogin")
public class LoginValidation extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email1=req.getParameter("email");
		String password1=req.getParameter("password");
		
		String choice=req.getParameter("choice");
		
		if(choice.equals("log in as customer"))
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
			EntityManager em=emf.createEntityManager();
			
			Query qu=em.createQuery("select a from Customer a where a.Cemail=?1 and a.Cpassword=?2");
			qu.setParameter(1, email1);
			qu.setParameter(2, password1);
			
			List<Customer> customer=qu.getResultList();
			if(customer.size()>0)
			{
				Customer c=customer.get(0);
				if(c.getCstatus().equals("active"))  // the merchantoptions.html page is depends upon status of merchant:
				{
					List<items> item=new ArrayList<items>();
					HttpSession hs=req.getSession();
					hs.setAttribute("customer",c);
					hs.setAttribute("itemList",item);
					RequestDispatcher rd= req.getRequestDispatcher("Custoption.jsp");
					rd.forward(req, resp);
				}
				else if(c.getCstatus().equals("inactive")) // fetching the status by using getMstatus() method.
				{
					PrintWriter pw=resp.getWriter();
					pw.print("Your Account Is Not Active");
					RequestDispatcher rd= req.getRequestDispatcher("login.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
				}
			}
			else
			{
				PrintWriter pw= resp.getWriter();
				pw.print("invalid credentials");
				RequestDispatcher rd= req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}
		}
		else if(choice.equals("log in as merchant"))
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
			EntityManager em=emf.createEntityManager();
			
			Query qu=em.createQuery("select a from Merchant a where a.Memail=?1 and a.Mpassword=?2");
			qu.setParameter(1, email1);
			qu.setParameter(2, password1);
					
			List<Merchant> merchant=qu.getResultList();
			if(merchant.size()>0)
			{
				Merchant m=merchant.get(0); // fetching the created object after correct validation by using get(index) method.
						 
				if(m.getMstatus().equals("active"))  // the merchantoptions.html page is depends upon status of merchant:
				{
					HttpSession hs=req.getSession();
					hs.setAttribute("merchant",m);
					RequestDispatcher rd= req.getRequestDispatcher("merchantoption.html");
					rd.forward(req, resp);
				}
				else if(m.getMstatus().equals("inactive")) // fetching the status by using getMstatus() method.
				{
					PrintWriter pw=resp.getWriter();
					pw.print("Your Merchant Account Is Not Active");
					RequestDispatcher rd= req.getRequestDispatcher("login.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
				}
				else if(m.getMstatus().equals("block"))
				{
					PrintWriter pw=resp.getWriter();
					pw.print("Your Account Is Blocked By Admin");
					RequestDispatcher rd= req.getRequestDispatcher("login.html");
					rd.include(req, resp);
					resp.setContentType("text/html");
				}
			}
			else
			{
				PrintWriter pw= resp.getWriter();
				pw.print("invalid credentials");
				RequestDispatcher rd= req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}
		}
		else if(choice.equals("log in as admin"))
		{
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
			EntityManager em=emf.createEntityManager();
			
			Query qu=em.createQuery("select a from Admin a where a.email=?1 and a.password=?2");
			qu.setParameter(1, email1);
			qu.setParameter(2, password1);
			
			List<Admin>admin=qu.getResultList();
			if(admin.size()>0)
			{
				Admin ad=admin.get(0);
				HttpSession hs=req.getSession();
				hs.setAttribute("admin",ad);
				
				RequestDispatcher rd= req.getRequestDispatcher("AdminOption.html");
				rd.forward(req, resp);
			}
			else
			{
				PrintWriter pw= resp.getWriter();
				pw.print("invalid credentials");
				RequestDispatcher rd= req.getRequestDispatcher("login.html");
				rd.include(req, resp);
				resp.setContentType("text/html");
			}
		}
	}
}
