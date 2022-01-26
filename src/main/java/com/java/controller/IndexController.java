package com.java.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.java.entity.OrderDetail;
import com.java.entity.Product;
import com.java.repository.OrderDetailRepository;
import com.java.repository.ProductRepository;

@Controller
public class IndexController extends CommonController {

	@Autowired
	ProductRepository productRepository;

	@Autowired
	OrderDetailRepository orderDetailRepository;

	@GetMapping(value = "/")
	public String index(Model model) {
		listproduct10(model);

		return "site/index";
	}

	// list product ở trang chủ limit 8 sản phẩm mới nhất
	@ModelAttribute("listProduct8")
	public List<Product> listproduct10(Model model) {
		List<Product> productList = productRepository.listProduct8();
		model.addAttribute("productList", productList);

		return productList;
	}
	//Hiển thị top 10 sản phẩm bán chạy nhất
	@ModelAttribute("topOrder")
    public String reporttop(Model model) {
        OrderDetail orderDetail = new OrderDetail();
        model.addAttribute("orderDetail", orderDetail);
        List<Object[]> topOrderList =  orderDetailRepository.topOrder();
        model.addAttribute("topOrderList", topOrderList);
        return "topOrder";
    }
	
	// Hiển thị danh sách hải sản tôm
	@ModelAttribute("topOrderTom")
    public String reporttom(Model model) {
        OrderDetail orderDetail = new OrderDetail();
        model.addAttribute("orderDetail", orderDetail);
        List<Product> topOrderTom = productRepository.findByNameT();
        model.addAttribute("topOrderTom", topOrderTom);
        return "topOrderTom";
    }
	// Hiển thị danh sách hải sản cua
		@ModelAttribute("topOrderCua")
	    public String reportCua(Model model) {
	        OrderDetail orderDetail = new OrderDetail();
	        model.addAttribute("orderDetail", orderDetail);
	        List<Product> topOrderCua = productRepository.findByNameC();
	        model.addAttribute("topOrderCua", topOrderCua);
	        return "topOrderCua";
	    }
		// Hiển thị danh sách hải sản ốc
				@ModelAttribute("topOrderOc")
			    public String reportOc(Model model) {
			        OrderDetail orderDetail = new OrderDetail();
			        model.addAttribute("orderDetail", orderDetail);
			        List<Product> topOrderOc = productRepository.findByNameOc();
			        model.addAttribute("topOrderOc", topOrderOc);
			        return "topOrderOc";
			    }
		// Hiển thị danh sách hải sản cá
				@ModelAttribute("topOrderCa")
			    public String reportCa(Model model) {
			        OrderDetail orderDetail = new OrderDetail();
			        model.addAttribute("orderDetail", orderDetail);
			        List<Product> topOrderCa = productRepository.findByNameCa();
			        model.addAttribute("topOrderCa", topOrderCa);
			        return "topOrderCa";
			    }

}
