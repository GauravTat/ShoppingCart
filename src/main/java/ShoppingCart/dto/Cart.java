package ShoppingCart.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Cart 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int Caid;
	double Catotalprice;
	
	@OneToOne
	Customer customer;
	@OneToMany(cascade = CascadeType.REMOVE)
	List<items> item;
	
	public List<items> getItem() {
		return item;
	}
	public void setItem(List<items> item) {
		this.item = item;
	}
	public int getCaid() {
		return Caid;
	}
	public void setCaid(int caid) {
		Caid = caid;
	}
	public double getCatotalprice() {
		return Catotalprice;
	}
	public void setCatotalprice(double catotalprice) {
		Catotalprice = catotalprice;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
}
