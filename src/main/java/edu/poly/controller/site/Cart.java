//package edu.poly.controller.site;
//
//import java.util.Collection;
//import java.util.Optional;
//
//import org.springframework.beans.BeanUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import edu.poly.domain.CartItem;
//import edu.poly.domain.Product;
//import edu.poly.repository.CartItemRepository;
//import edu.poly.repository.ProductRepository;
//import edu.poly.service.CartItemService;
//
//
//@Controller()
//@RequestMapping("site")
//public class Cart {
//
//	@Autowired
//	CartItemRepository dao;
//	
//	@Autowired
//    CartItemService cartItemService;
//	
//	@Autowired
//	ProductRepository productRepository;
//
//	@GetMapping("cart")
//	public String cart(Model model) {
//		Collection<CartItem> cartItems = cartItemService.getCartItems();
//		
//		model.addAttribute("cartItems",cartItems);
//		model.addAttribute("total",cartItemService.getAmount());
//		model.addAttribute("NoOfItems",cartItemService.getCount());
//		
//		return "site/cart";
//		
//	}
//	
//	@GetMapping("cart/add/{productId}")
//	public String add(@PathVariable("productId") Integer productId) {
//	    Optional<Product> productOpt = productRepository.findById(productId);
//	    
//	    if (productOpt.isPresent()) {
//	        // Nếu tìm thấy sản phẩm với productId tương ứng
//	        Product product = productOpt.get();
//	        
//	        // Tạo một đối tượng CartItem mới và sao chép thuộc tính từ Product vào CartItem
//	        CartItem item = new CartItem();
//	        BeanUtils.copyProperties(product, item);
//	        
//	        // Thiết lập số lượng mặc định là 1 và gán sản phẩm vào CartItem
//	        item.setProduct(product);
//	        item.setQuantity(1);
//	        // Gọi service để thêm CartItem vào giỏ hàng
//	        cartItemService.add(item);
//	        
//	        // Sau khi thêm thành công, chuyển hướng về trang giỏ hàng
//	        return "redirect:/site/cart";
//	    } else {
//	        // Xử lý khi không tìm thấy sản phẩm với productId tương ứng
//	        // Có thể cải tiến để hiển thị thông báo lỗi hoặc thực hiện hành động khác
//	        return "redirect:/site/cart";
//	    }
//	}
//
//
//	
//	@GetMapping("cart/remove/{productId}")
//	public String remove(@PathVariable("productId") Integer productId) {
//		cartItemService.remove(productId);
//		
//		return "redirect:/site/cart";
//	}
//	
//	@PostMapping("cart/update")
//	public String update(@RequestParam("productId") Integer productId, @RequestParam("quantity") Integer quantity) {
//		cartItemService.update(productId, quantity);
//		return "redirect:/site/cart";
//	}
//	
//	@GetMapping("cart/clear")
//	public String clear() {
//		return "redirect:/site/cart";
//	}
//	
//}
