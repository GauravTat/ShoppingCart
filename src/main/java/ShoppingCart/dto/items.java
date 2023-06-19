package ShoppingCart.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class items 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int Itid;
	String itname;
	String itcatagory;
	double itprice;
	long itquantity;
	
	@ManyToOne
	Cart cart;

	public int getItid() {
		return Itid;
	}

	public void setItid(int Itid) {
		this.Itid = Itid;
	}

	public String getItname() {
		return itname;
	}

	public void setItname(String itname) {
		this.itname = itname;
	}

	public String getItcatagory() {
		return itcatagory;
	}

	public void setItcatagory(String itcatagory) {
		this.itcatagory = itcatagory;
	}

	public double getItprice() {
		return itprice;
	}

	public void setItprice(double itprice) {
		this.itprice = itprice;
	}

	public long getItquantity() {
		return itquantity;
	}

	public void setItquantity(long itquantity) {
		this.itquantity = itquantity;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
