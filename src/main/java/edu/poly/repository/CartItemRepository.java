package edu.poly.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.domain.CartItem;
import edu.poly.domain.Customer;
import edu.poly.domain.Product;

public interface CartItemRepository extends JpaRepository<CartItem, Integer>{

	 List<CartItem> findByCustomer_CustomerId(int customerId);
	 
	 CartItem findByCustomerAndProduct(Customer customer, Product product);
	 
	 @Query("SELECT ci FROM CartItem ci WHERE ci.customer.id = :customerId AND ci.product.id = :productId")
	 CartItem findByCustomerAndProductId(@Param("customerId") Integer customerId, @Param("productId") Integer productId);

}
