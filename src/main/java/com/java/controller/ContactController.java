package com.java.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.entity.Customer;
import com.java.entity.Order;
import com.java.entity.OrderDetail;
import com.java.repository.CustomerRepository;
import com.java.repository.OrderDetailRepository;
import com.java.repository.OrderRepository;





@Controller
public class ContactController extends CommonController{
	@Autowired
	OrderDetailRepository orderDetailRepository;
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	@GetMapping(value = "/contact")
	public String contact() {
		
		return "site/contact";
	}	
	
	@GetMapping("/editProfile/{customerId}")
	public ModelAndView editForm(ModelMap model, Principal principal) {
		
		model.addAttribute("customer", customerRepository.findByEmail(principal.getName()).get());

		model.addAttribute("totalCartItems", shoppingCartService.getCount());
		return new ModelAndView("site/contact");
	}

	@PostMapping("/customer/editProfile")
	public ModelAndView edit(ModelMap model, @Valid @ModelAttribute("customer") Customer dto, BindingResult result,
			 Principal principal) throws IOException {
		Customer c = customerRepository.findByEmail(principal.getName()).get();
		c.setFullname(dto.getFullname());
		c.setEmail(dto.getEmail());
		customerRepository.save(c);

		return new ModelAndView("forward:/customer/info");
	}


	@RequestMapping("/customer/info")
	public ModelAndView info(ModelMap model, Principal principal) {

		Optional<Customer> c = customerRepository.findByEmail(principal.getName());

		model.addAttribute("customer", customerRepository.findByEmail(principal.getName()).get());
		
		Page<Order> listO0 = orderRepository.findByCustomerId(c.get().getCustomerId(), 0,
				PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "orderId")));
		model.addAttribute("orders0", listO0);

		Page<Order> listO1 = orderRepository.findByCustomerId(c.get().getCustomerId(), 1,
				PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "orderId")));
		model.addAttribute("orders1", listO1);

		Page<Order> listO2 = orderRepository.findByCustomerId(c.get().getCustomerId(), 2,
PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "orderId")));
		model.addAttribute("orders2", listO2);

		Page<Order> listO3 = orderRepository.findByCustomerId(c.get().getCustomerId(), 3,
				PageRequest.of(0, 10, Sort.by(Sort.Direction.DESC, "orderId")));
		model.addAttribute("orders3", listO3);

		model.addAttribute("user", c.get());
		model.addAttribute("totalCartItems", shoppingCartService.getCount());
		return new ModelAndView("/site/infomation", model);
	}


	@RequestMapping("/customer/detail/{id}")
	public ModelAndView detail(ModelMap model, @PathVariable("id") int id) {

		List<OrderDetail> listO = orderDetailRepository.findByOrderId(id);
		List<Order> listO1 = orderRepository.findByOrderId(id);
		List<Order> listO2 = orderRepository.findByOrderId(id);
		model.addAttribute("amount", orderRepository.findById(id).get().getAmount());
		model.addAttribute("orderDetail", listO);
		model.addAttribute("order", listO1);
		model.addAttribute("order02", listO2);
		model.addAttribute("orderId", id);
		
		// set active front-end
		model.addAttribute("menuO", "menu");
		return new ModelAndView("/site/detail"	);
	}
	

	// format currency
	public String format(String number) {
		DecimalFormat formatter = new DecimalFormat("###,###,###.##");

		return formatter.format(Double.valueOf(number)) + " VNĐ";
	}
	
	@RequestMapping("/cancel/{order-id}")
	public ModelAndView cancel(ModelMap model, @PathVariable("order-id") int id) {
		Optional<Order> o = orderRepository.findById(id);
		if (o.isEmpty()) {
			return new ModelAndView("forward:/customer/info", model);
		}
		Order oReal = o.get();
		oReal.setStatus(3);
		orderRepository.save(oReal);	
		return new ModelAndView("redirect:/customer/info", model);
		
	}
	
}
