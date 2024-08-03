package edu.poly.controller.site;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.domain.CartItem;
import edu.poly.domain.Customer;
import edu.poly.domain.Product;
import edu.poly.repository.CartItemRepository;
import edu.poly.repository.ProductRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("site")
public class CartItemController {

	@Autowired
	CartItemRepository cartItemRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@GetMapping("cartitem")
	public String index(Model model, HttpSession session) {
		Customer user = (Customer) session.getAttribute("user");
		 if (user == null) {
			 return "redirect:/site/login"; 
		 }
		CartItem item = new CartItem();
		model.addAttribute("item", item);
		List<CartItem> items = cartItemRepository.findByCustomer_CustomerId(user.getCustomerId());
		model.addAttribute("items", items);
		return "site/cart";
	}
	
	
	@PostMapping("/cartitem/create")
	public String create(@RequestParam("productId") int productId, HttpSession session) {
		Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            return "redirect:/site/login"; 
        }
        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            return "redirect:/site/404"; 
        }
        
        CartItem cartItem = cartItemRepository.findByCustomerAndProduct(user, product);
        if (cartItem != null) {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItem.setAmount(cartItem.getPrice() * cartItem.getQuantity());
        } else {
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setCustomer(user);
            cartItem.setQuantity(1);
            cartItem.setPrice(product.getPrice());
            cartItem.setAmount(product.getPrice() * cartItem.getQuantity());
        }

        cartItemRepository.save(cartItem);
        return "redirect:/site/cartitem";
	}
	
	@GetMapping("/cartitem/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		cartItemRepository.deleteById(id);
		return "redirect:/site/cartitem";
	}
	
	
	
	@GetMapping("/cartitem/updateQuantity")
	public String updateQuantity(@RequestParam("productId") int productId,
	                             @RequestParam("quantity") int quantity,
	                             HttpSession session) {
	    Customer user = (Customer) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/site/login"; 
	    }
	
	    // Lấy thông tin sản phẩm từ productId
	    CartItem cartItem = cartItemRepository.findByCustomerAndProductId(user.getCustomerId(), productId);
	    if (cartItem != null) {
	        // Giới hạn số lượng tối thiểu là 1
	        if (quantity >= 1) {
	            cartItem.setQuantity(quantity);
	            cartItem.setAmount(cartItem.getPrice() * quantity);
	            cartItemRepository.save(cartItem);
	        }
	    }
	
	    return "redirect:/site/cartitem"; 
	}
	
}
