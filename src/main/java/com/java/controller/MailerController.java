package com.java.controller;


import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.entity.Customer;
import com.java.repository.CustomerRepository;
import com.java.service.SendMailService;
import com.java.service.impl.MailerService;




@Controller
public class MailerController {
	@Autowired
	MailerService mailer;

	@Autowired
	CustomerRepository customersRepository;
	@Autowired
	HttpSession session;
	@Autowired
	SendMailService sendMailService;
	@Autowired
	MailerService mailerService;
	
	@ResponseBody
	@RequestMapping("/mailer/demo1")
	public String demo1(Model model) {
		try {
			mailer.send("nguyenvietnhat113@gmail.com", "Subject2", "Body");			
			return "OK";
		} catch (MessagingException e) {
			return e.getMessage();
		}
	}
	
	@ResponseBody
	@RequestMapping("/mailer/demo")
	public ModelAndView forgotPassowrd(ModelMap model, @RequestParam("email") String email) {
		List<Customer> listC = customersRepository.findAll();
		for (Customer c : listC) {
			if (email.trim().equals(c.getEmail())) {
				session.removeAttribute("otp");
				int random_otp = (int) Math.floor(Math.random() * (999999 - 100000 + 1) + 100000);
				session.setAttribute("otp", 123456);
				String body = "<div>\r\n"
						+ "        <h3>Mã OTP của bạn là: <span style=\"color:red; font-weight: bold;\">" + random_otp
						+ "</span></h3>\r\n" + "    </div>";
				mailerService.queue(email, "Quên mật khẩu?", body);

				model.addAttribute("email", email);
				model.addAttribute("message", "Mã OTP đã được gửi tới Email, hãy kiểm tra Email của bạn!");
				return new ModelAndView("/site/confirmOtp", model);
			}
		}
		model.addAttribute("error", "Email này không tồn tại trong hệ thống!");
		return new ModelAndView("/site/forgotPassword", model);
	}
	
	@ResponseBody
	@RequestMapping("/mailer/demo2")
	public String demo2(Model model) {		
			mailer.queue("phunglv@fe.edu.vn", "Subject1", "Body1");
			mailer.queue("phungsts@gmail.com", "Subject2", "Body2");
			return "OK";		
	}
}

