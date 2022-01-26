package com.java.config.oauth;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.java.entity.Customer;
import com.java.entity.Role;
import com.java.repository.CustomerRepository;
import com.java.repository.UserRoleRepository;




@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		CustomOAuth2User oauth2User = (CustomOAuth2User) authentication.getPrincipal();
		String email = oauth2User.getName();
		System.out.println(email+"*********");
		Optional<Customer> cus = customerRepository.findByEmail(email);
		if(cus.isEmpty()) {
			Customer customer = new Customer();
			customer.setFullname(oauth2User.getNameReal());
			customer.setCustomerId(email);
			customer.setEmail(email);
			customer.setEnabled(true);
			customer.setRoleId("0");
			customer.setPassword(bCryptPasswordEncoder.encode("123@ABCxyzalualua"));
			Date date = new Date();
			customer.setCreateDate(date);
			customerRepository.save(customer);
			Optional<Role> a = userRoleRepository.findById(2L);

		}
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
