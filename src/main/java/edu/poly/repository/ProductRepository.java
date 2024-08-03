package edu.poly.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.domain.Product;
import edu.poly.dto.Report;

public interface ProductRepository extends JpaRepository<Product, Integer>{

	 @Query("SELECT c FROM Product c WHERE c.stock = true")
	 List<Product> findByIsActivatedTrue();
	 
	 
	 @Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	 List<Product> findByPrice(double minPrice, double maxPrice);
	 
	 
	 Page<Product> findAllByOrderByProductIdAsc(PageRequest pageRequest);
	 
	 @Query("SELECT c FROM Product c WHERE c.stock = true")
	 Page<Product> findByIsActivatedTrue(Pageable pageable);
	 
	 Page<Product> findByCategory_CategoryId(int categoryId, Pageable pageable);
	 
	 @Query("SELECT p FROM Product p WHERE p.name LIKE %:keywords% AND p.stock = true")
	 List<Product> findByKeywords(@Param("keywords") String keywords);
	 
	 
	 @Query("SELECT new Report(o.category, sum(o.price), count(o)) " + " FROM Product o " + " GROUP BY o.category"
				+ " ORDER BY sum(o.price) DESC")
	 List<Report> getInventoryByCategory();
}
