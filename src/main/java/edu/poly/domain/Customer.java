package edu.poly.domain;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Customers")
public class Customer implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerId;
	@Column(nullable = false, unique = true)
	@NotNull
	private String username;
	@Column(nullable = false)
	@NotNull
	private String password;
	@Column(nullable = false, columnDefinition = "NVARCHAR(50)")
	@NotNull
	private String name;
	@Column(nullable = false, unique = true)
	@NotNull
	private String email;
	@Column(nullable = false, unique = true)
	@NotNull
	private String phoneNumber;
	private String photo;
	private boolean isActivated;
	private boolean isAdmin;

	@OneToMany(mappedBy = "customer")
	List<Order> orders;
	
	@OneToMany(mappedBy = "customer")
	private List<CartItem> cartItems;
	
	public boolean getIsActivated() {
        return isActivated;
    }

    public void setIsActivated(boolean isActivated) {
        this.isActivated = isActivated;
    }

    public boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}