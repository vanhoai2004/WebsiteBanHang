package edu.poly.controller.site;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.domain.Customer;
import edu.poly.repository.CustomerRepository;
import jakarta.servlet.http.HttpSession;

@Controller()
@RequestMapping("site")
public class CustomerController {

	@Autowired
    CustomerRepository dao;

    @Autowired
    HttpSession session;
	
	@GetMapping("login")
	public String login() {
		return"site/login";
	}
	
	@GetMapping("register")
	public String register() {
		return"site/register";
	}
	
	@GetMapping("logout")
    public String logout() {
        session.removeAttribute("user");
        return "site/login";
    }
	
	
	
	@PostMapping("login")
    public String login(Model model, @RequestParam("username") String username,
                        @RequestParam("password") String password) {
        try {
            Customer user = dao.findByUsername(username); 
            if (user == null || !user.getPassword().equals(password)) {
                model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
            } else {
                session.setAttribute("user", user);
                return "redirect:/site/index";
            }
        } catch (Exception e) {
            model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        }
        return "site/login";
    }
	
	
	
	@PostMapping("/register/create")
	public String create(@ModelAttribute("item") Customer item, BindingResult result) {
		if (result.hasErrors()) {
	        return "site/register";
	    }
		item.setIsActivated(true);
		dao.save(item);
		return "redirect:/site/login";
	}
}
