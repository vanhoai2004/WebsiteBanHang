package edu.poly.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

}
