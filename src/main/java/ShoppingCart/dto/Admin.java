package ShoppingCart.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Admin
{
	@Id
	int id;
	String email;
	String password;
	
	@OneToMany
	List<Merchant>merch;
	
	public List<Merchant> getMerch() {
		return merch;
	}
	public void setMerch(List<Merchant> merch) {
		this.merch = merch;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
