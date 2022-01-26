package com.java.controller;

import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.entity.ChangePassword;
import com.java.entity.Customer;
import com.java.repository.CustomerRepository;
import com.java.service.SendMailService;
import com.java.service.impl.MailerService;

@Controller
public class LoginController extends CommonController{

	@Autowired
	CustomerRepository customersRepository;
	@Autowired
	HttpSession session;
	@Autowired
	SendMailService sendMailService;
	@Autowired
	MailerService mailerService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping(value = "/login")
	public String login(Model model, @RequestParam("error") Optional<String> error) {
		String errorString = error.orElse("false");
		if (errorString.equals("true")) {
			model.addAttribute("error", "Tài khoản hoặc mật khẩu không chính xác, vui lòng thử lại!");
		}

		model.addAttribute("customer", new Customer());

		return "site/login";
	}
	@GetMapping("/forgotPassword")
	public ModelAndView forgotFrom() {
		return new ModelAndView("/site/forgotPassword");
	}

	@PostMapping("/forgotPassword")
	public ModelAndView forgotPassowrd(ModelMap model, @RequestParam("email") String email) throws MessagingException {
		List<Customer> listC = customerRepository.findAll();
		for (Customer c : listC) {
			if (email.trim().equals(c.getEmail())) {
				session.removeAttribute("otp");
				int random_otp = (int) Math.floor(Math.random() * (999999 - 100000 + 1) + 100000);
				session.setAttribute("otp", random_otp);
				String body = "<div>\r\n"
						+ "        <h3>Mã OTP của bạn là: <span style=\"color:red; font-weight: bold;\">" + random_otp
						+ "</span></h3>\r\n" + "    </div>";
				mailerService.send(email,"Quên mật khẩu" , body);;

				model.addAttribute("email", email);
				model.addAttribute("message", "Mã OTP đã được gửi tới Email, hãy kiểm tra Email của bạn!");
				return new ModelAndView("/site/confirmOtp", model);
			}
		}
		model.addAttribute("error", "Email này không tồn tại trong hệ thống!");
		return new ModelAndView("/site/forgotPassword", model);
	}

	@PostMapping("/confirmOtp")
	public ModelAndView confirm(ModelMap model, @RequestParam("otp") String otp, @RequestParam("email") String email) {
		if (otp.equals(String.valueOf(session.getAttribute("otp")))) {
			model.addAttribute("email", email);
			model.addAttribute("newPassword", "");
			model.addAttribute("confirmPassword", "");
			model.addAttribute("changePassword", new ChangePassword());
			return new ModelAndView("/site/changePassword", model);
		}
		model.addAttribute("error", "Mã OTP không trùng, vui lòng kiểm tra lại!");
		return new ModelAndView("/site/confirmOtp", model);
	}

	@PostMapping("/changePassword")
	public ModelAndView changeForm(ModelMap model,
			@Valid @ModelAttribute("changePassword") ChangePassword changePassword, BindingResult result,
			@RequestParam("email") String email, @RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword) {
		if (result.hasErrors()) {

			model.addAttribute("newPassword", newPassword);
			model.addAttribute("newPassword", confirmPassword);
//			model.addAttribute("changePassword", changePassword);
			model.addAttribute("email", email);
			return new ModelAndView("/site/changePassword", model);
		}

		if (!changePassword.getNewPassword().equals(changePassword.getConfirmPassword())) {

			model.addAttribute("newPassword", newPassword);
			model.addAttribute("newPassword", confirmPassword);
//			model.addAttribute("changePassword", changePassword);
			model.addAttribute("error", "error");
			model.addAttribute("email", email);
			return new ModelAndView("/site/changePassword", model);
		}
		Customer c = customerRepository.findByEmail(email).get();
		c.setEnabled(true);
		c.setPassword(bCryptPasswordEncoder.encode(newPassword));
		customerRepository.save(c);
		model.addAttribute("message", "Đổi mật khẩu thành công!");
		model.addAttribute("email", "");
		session.removeAttribute("otp");
		return new ModelAndView("/site/changePassword", model);
	}
}
