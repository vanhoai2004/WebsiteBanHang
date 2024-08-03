package edu.poly.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.domain.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{

	List<Customer> findByIsActivatedTrue();
	
	Customer findByUsername(String username);
}
