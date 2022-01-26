package com.java.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.controller.CommonController;
import com.java.entity.Brand;
import com.java.entity.Category;
import com.java.entity.Customer;
import com.java.entity.Product;
import com.java.entity.Role;
import com.java.repository.CustomerRepository;



@Controller
public class CustomerController extends CommonController{
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;


	@Autowired
	CustomerRepository customerRepository;

	@GetMapping(value = "/admin/customers")
	public String customer(Model model, Principal principal) {
		
		Customer customer = customerRepository.findByEmail(principal.getName()).get();
		model.addAttribute("customer", customer);
		
		List<Customer> customers = customerRepository.findAll();
		model.addAttribute("customers", customers);
		
		return "/admin/customers";
	}
	
	@RequestMapping(value = "/add")
	public String addCourse(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, ModelMap model,
			Principal principal) {

		// check error
		if (result.hasErrors()) {

			return "/admin/customers";
		}

		// check email by database
		if (!checkEmail(customer.getEmail())) {
			model.addAttribute("error", "Đăng ký thất bại, Email này đã được sử dụng!");

			return "/admin/customers";
		}

		// check id login by database
		if (!checkIdlogin(customer.getCustomerId())) {
			model.addAttribute("error", "Đăng kí thất bại, ID Login này đã được sử dụng!");

			return "/admin/customers";
		}

		customer.setEnabled(true);
		customer.setRoleId("1");
		customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
		Date date = new Date();
		customer.setCreateDate(date);

		Customer c = customerRepository.save(customer);

		Role role = new Role();
		role.setRoleName("ROLE_USER");
		role.setCustomer(customer);

		
		if (null != c) {
			model.addAttribute("message", "Đăng ký thành công, vui lòng đăng nhập!");
			model.addAttribute("customer", customer);
		} else {
			model.addAttribute("error", "failure");
			model.addAttribute("customer", customer);
		}

		return "redirect:/admin/customers";
	}

	// check email
	public boolean checkEmail(String email) {
		List<Customer> list = customerRepository.findAll();
		for (Customer c : list) {
			if (c.getEmail().equalsIgnoreCase(email)) {
				return false;
			}
		}
		return true;
	}
	
	// check ID Login
		public boolean checkIdlogin(String customerId) {
			List<Customer> listC = customerRepository.findAll();
			for (Customer c : listC) {
				if (c.getCustomerId().equalsIgnoreCase(customerId)) {
					return false;
				}
			}
			return true;
		}

		@InitBinder
		public void initBinder(WebDataBinder binder) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			sdf.setLenient(true);
			binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		}
		
		@GetMapping("/deleteCustomer/{id}")
		public String delProduct(@PathVariable("id") String id, Model model, Customer customer) {
			
			customerRepository.deleteById(id);
			model.addAttribute("message", "Delete successful!");

			return "redirect:/admin/customers";
		}

	
}
