package edu.poly.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.poly.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{

}
