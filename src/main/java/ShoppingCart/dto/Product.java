package ShoppingCart.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int Pid;
	String Pname;
	String Pcatagory;
	double Pprice;
	long PStock;
	@ManyToOne//(cascade = {CascadeType.PERSIST ,CascadeType.REMOVE})
	Merchant merchant;
	
	public int getPid() {
		return Pid;
	}
	public void setPid(int pid) {
		Pid = pid;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getPcatagory() {
		return Pcatagory;
	}
	public void setPcatagory(String pcatagory) {
		Pcatagory = pcatagory;
	}
	public double getPprice() {
		return Pprice;
	}
	public void setPprice(double pprice) {
		Pprice = pprice;
	}
	public long getPStock() {
		return PStock;
	}
	public void setPStock(long pStock) {
		PStock = pStock;
	}
	public Merchant getMerchant() {
		return merchant;
	}
	public void setMerchant(Merchant merchant) {
		this.merchant = merchant;
	}
}
