package com.java.repository;




import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.java.entity.Order;
import com.java.entity.OrderDetail;


@Repository
public interface OrderRepository extends JpaRepository<Order, Integer>{
	@Query(value = "select * from orders where customerId = ?1 and status = ?2", nativeQuery = true)
	Page<Order> findByCustomerId(String id, int status, Pageable pageable);
	
	@Query(value = "select * from orders where status = ?", nativeQuery = true)
	Page<Order> findByStatus(int status, Pageable pageable);
	
	Page<Order> findByorderId(int id, Pageable pageable);
	@Query(value = "select * from orders where orderId = ?", nativeQuery = true)
	List<Order> findByOrderId(int id);
}


