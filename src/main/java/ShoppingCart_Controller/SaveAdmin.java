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

import ShoppingCart.dto.Admin;
@WebServlet("/saveadmin11")
public class SaveAdmin extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int Aid=Integer.parseInt(req.getParameter("id"));
		String Aemail=req.getParameter("email");
		String Apassword1=req.getParameter("password");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Admin admin=new Admin();
		admin.setId(Aid);
		admin.setEmail(Aemail);
		admin.setPassword(Apassword1);
		
		et.begin();
		em.persist(admin);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.print("Admin Account created successfully");
		
		RequestDispatcher rd=req.getRequestDispatcher("login.html");
		rd.include(req, resp);
		resp.setContentType("text/html");
		
	}
}
