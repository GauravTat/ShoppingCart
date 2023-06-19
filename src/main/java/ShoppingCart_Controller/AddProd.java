package ShoppingCart_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import ShoppingCart.dto.Merchant;
import ShoppingCart.dto.Product;

@WebServlet("/addprod")
public class AddProd extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String Cate=req.getParameter("cat");
		double price=Integer.parseInt(req.getParameter("price"));
		long stock=Integer.parseInt(req.getParameter("stock"));
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Gaurav");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Product product=new Product();
		product.setPname(name);
		product.setPcatagory(Cate);
		product.setPprice(price);
		product.setPStock(stock);
		
		HttpSession hs=req.getSession();
		Merchant mer=(Merchant)hs.getAttribute("merchant");
		product.setMerchant(mer);
		
		List<Product> pro=mer.getProduct();
		if(pro.size()>0){
			pro.add(product);
		}
		else{
			pro=new ArrayList<Product>();//if it null then create new list and insert data
			pro.add(product);
		}
		mer.setProduct(pro);
		et.begin();
		em.persist(product);
		em.merge(mer);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.write("Product added Successfully");
		RequestDispatcher rd=req.getRequestDispatcher("merchantoption.html");
		rd.include(req, resp);
		resp.setContentType("text/html");
	}
}
