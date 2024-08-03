package edu.poly.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import edu.poly.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{

	List<Category> findByIsActivatedTrue();
	
	@Query("SELECT p FROM Category p WHERE p.name LIKE %:keywords% AND p.isActivated = true")
	List<Category> findByKeywords(@Param("keywords") String keywords);

}
