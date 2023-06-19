package ShoppingCart.dto;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Customer 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //  For generating id automatically.
	private int Cid;
	private String Cname;
	@Column(unique=true)
	private String Cemail;
	private String Cpassword;
	@Column(unique=true)
	private long Cmobno;
	private String Cstatus;
	
	@OneToOne
	private Cart cart;
	
	public int getCid() {
		return Cid;
	}
	public void setCid(int cid) {
		Cid = cid;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getCemail() {
		return Cemail;
	}
	public void setCemail(String cemail) {
		Cemail = cemail;
	}
	public String getCpassword() {
		return Cpassword;
	}
	public void setCpassword(String cpassword) {
		Cpassword = cpassword;
	}
	public long getCmobno() {
		return Cmobno;
	}
	public void setCmobno(long cmobno) {
		Cmobno = cmobno;
	}
	public String getCstatus() {
		return Cstatus;
	}
	public void setCstatus(String cstatus) {
		Cstatus = cstatus;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
