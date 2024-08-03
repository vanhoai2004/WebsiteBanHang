package edu.poly.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Products")
public class Product implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	@Column(columnDefinition = "NVARCHAR(255)", nullable = false)
	private String name;
	@Column(nullable = false)
	private int quantity;
	@Column(nullable = false)
	private double price;
	private String image;
	@Column(columnDefinition = "NVARCHAR(255)", nullable = false)
	private String description;
	private double discount;
	@Temporal(TemporalType.DATE)
	private Date createDate;
	private boolean stock; // còn hàng hay không 
	@ManyToOne @JoinColumn(name = "categoryId")
	Category category ;
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;
	@OneToMany(mappedBy = "product")
	private List<CartItem> cartItems;
}
