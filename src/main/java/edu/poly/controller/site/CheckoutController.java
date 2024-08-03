package edu.poly.controller.site;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.domain.CartItem;
import edu.poly.domain.Customer;
import edu.poly.repository.CartItemRepository;
import edu.poly.repository.OrderRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("site")
public class CheckoutController {

	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	CartItemRepository cartItemRepository;
	
	@GetMapping("checkout")
	public String checkout(HttpSession session, Model model) {
		Customer user = (Customer) session.getAttribute("user");
		if (user == null) {
            return "redirect:/site/login"; 
        }
		model.addAttribute("user", user);
		
		List<CartItem> cartitem = cartItemRepository.findByCustomer_CustomerId(user.getCustomerId());
		model.addAttribute("cartitem", cartitem);
		return"site/checkout";
	}
	
	
	@PostMapping("/checkout/create")
	public String create(@RequestParam("productId") int productId, HttpSession session) {
		Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            return "redirect:/site/checkout"; 
        }
       

        return "redirect:/site/cartitem";
	}
}
