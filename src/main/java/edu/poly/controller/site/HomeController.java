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


@Controller("siteHomeController")
@RequestMapping("site")
public class HomeController {

	@Autowired
	ProductRepository dao;
	
	@GetMapping("index")
	public String index(@RequestParam(value = "categoryId", required = false, defaultValue = "0") int categoryId, 
            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
            Model model) {
		
		int pageSize = 8;
	    PageRequest pageRequest = PageRequest.of(page, pageSize);
		
	    Page<Product> productsPage;
	    if (categoryId == 0) {
	        productsPage = dao.findByIsActivatedTrue(pageRequest); 
	    } else {
	        productsPage = dao.findByCategory_CategoryId(categoryId, pageRequest); 
	    }
		
	    List<Product> products = productsPage.getContent();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productsPage.getTotalPages());
        model.addAttribute("categoryId", categoryId);
        
        
        PageRequest pageRequest2 = PageRequest.of(0, 6);
        Product item = new Product();
		model.addAttribute("item", item);
		Page<Product> productsPage2 = dao.findAllByOrderByProductIdAsc(pageRequest2);
		List<Product> items = productsPage2.getContent();
		model.addAttribute("items", items);
        
        
		return"site/index";
	}
	

	@GetMapping("/index/view/{productId}")
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
	
	
	
	@GetMapping("shop-detail")
	public String shopdetail() {
		return"site/shop-detail";
	}
	
	@GetMapping("contact")
	public String contact() {
		return"site/contact";
	}
	
	@GetMapping("404")
	public String erorr() {
		return"site/404";
	}
	
}
