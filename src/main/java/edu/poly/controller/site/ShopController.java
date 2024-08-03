package edu.poly.controller.site;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.domain.Product;
import edu.poly.repository.ProductRepository;

@Controller
@RequestMapping("site")
public class ShopController {

	@Autowired
	ProductRepository dao;
	
	@GetMapping("shop")
	public String shop(@RequestParam(value = "page", required = false, defaultValue = "0") int page,
            Model model) {
		
		int pageSize = 9;
	    PageRequest pageRequest = PageRequest.of(page, pageSize);
		
	    Page<Product> productsPage = dao.findByIsActivatedTrue(pageRequest); // Tất cả sản phẩm
		
	    List<Product> products = productsPage.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productsPage.getTotalPages());
       
		return"site/shop";
	}
	
	@GetMapping("/shop/view/{productId}")
	public String view(Model model, @PathVariable("productId") Integer productId) {
		 Optional<Product> optionalProduct = dao.findById(productId);
		    
		    if (optionalProduct.isPresent()) {
		        // Nếu tìm thấy category, đưa vào model và trả về view "admin/category"
		    	Product item = optionalProduct.get();
		        model.addAttribute("item", item);
		        return "site/shop-detail";
		    } else {
		        // Nếu không tìm thấy category, đưa thông báo lỗi vào model và trả về view hiển thị lỗi
		        String errorMessage = "Không tìm thấy Category với ID " + productId;
		        model.addAttribute("errorMessage", errorMessage);
		        return "site/404"; 
		    }
	}
	

	
}
