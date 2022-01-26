package com.java.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.java.entity.Role;


@Repository
public interface UserRoleRepository extends JpaRepository<Role, Long>{
	
//	@Query(value = "select * from roles where customerId = ?", nativeQuery = true)
//	Optional<Role> findByCustomerId(Long customerId);
}
