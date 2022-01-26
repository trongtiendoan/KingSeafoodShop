package com.java.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.java.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	Page<Product> findByNameContaining(String name, Pageable page);
	// Hiển thị danh sách product mới nhất ở trang chủ LIMIT = 8
	@Query(value = "SELECT * FROM products ORDER BY enteredDate DESC limit 8", nativeQuery = true)
	public List<Product> listProduct8();
	
	// Hiển thị mỗi thể loại có bao nhiêu sản phẩm
	@Query(value = "SELECT c.categoryId,c.categoryName,\r\n"
			+ "COUNT(*) AS SoLuong\r\n"
			+ "FROM products b\r\n"
			+ "JOIN categories c ON b.categoryId = c.categoryId\r\n"
			+ "GROUP BY c.categoryName;" , nativeQuery = true)	
	public List<Object[]> listCategoryByProductName();

	// sản phẩm theo danh mục
	@Query(value = "SELECT * FROM products where categoryId = ?", nativeQuery = true)
	public List<Product> listProductByCategory(Integer id);

	// Sản phẩm theo danh nhãn hiệu
	@Query(value = "SELECT * FROM products where brandId = ?", nativeQuery = true)
	public List<Product> listProductByBrand(Integer id);
	
	// Gợi ý sản phẩm cùng thể loại
	@Query(value = "SELECT \r\n"
			+ "*FROM products AS p\r\n"
			+ "WHERE p.categoryId = ?" , nativeQuery = true)
	public List<Product> productsByCategory(Integer categoryId);
	
	// Search Product
	@Query(value = "SELECT * FROM products WHERE name LIKE %?1%", nativeQuery = true)
	public List<Product> searchProduct(String name);
	// Gợi ý sản phẩm cùng thể loại tôm
		@Query(value = "SELECT * FROM products where categoryId = 1" , nativeQuery = true)
	    List<Product> findByNameT();
	// Gợi ý sản phẩm cùng thể loại cua
		@Query(value = "SELECT * FROM products where categoryId = 2" , nativeQuery = true)
	    List<Product> findByNameC();
	//Gợi ý sản phẩm ốc
		@Query(value = "SELECT * FROM products where categoryId = 6" , nativeQuery = true)
	    List<Product> findByNameOc();
	//Gợi ý sản phẩm cá
		@Query(value = "SELECT * FROM products where categoryId = 3" , nativeQuery = true)
		List<Product> findByNameCa();

}
