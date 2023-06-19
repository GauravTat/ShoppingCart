package ShoppingCart.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Merchant 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //For generating id automatically
	int Mid;
	String Mname;
	long MobNo;
	String Memail;
	String Mpassword;
	String Mstatus;
	
	@ManyToOne
	Admin admin;
	@OneToMany(cascade = CascadeType.REMOVE)
	List<Product> product;
	
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public int getMid() {
		return Mid;
	}
	public void setMid(int mid) {
		Mid = mid;
	}
	public String getMname() {
		return Mname;
	}
	public void setMname(String mname) {
		Mname = mname;
	}
	public long getMobNo() {
		return MobNo;
	}
	public void setMobNo(long mobNo) {
		MobNo = mobNo;
	}
	public String getMemail() {
		return Memail;
	}
	public void setMemail(String memail) {
		Memail = memail;
	}
	public String getMpassword() {
		return Mpassword;
	}
	public void setMpassword(String mpassword) {
		Mpassword = mpassword;
	}
	public String getMstatus() {
		return Mstatus;
	}
	public void setMstatus(String mstatus) {
		Mstatus = mstatus;
	}
	
	
}
