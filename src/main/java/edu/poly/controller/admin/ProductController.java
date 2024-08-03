package edu.poly.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.poly.domain.Category;
import edu.poly.domain.Product;
import edu.poly.dto.Productdto;
import edu.poly.repository.CategoryRepository;
import edu.poly.repository.ProductRepository;
import edu.poly.service.SessionService;
import jakarta.servlet.ServletContext;

@Controller
@RequestMapping("admin")
public class ProductController {
	@Autowired
	ProductRepository dao;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	SessionService session;
	
	@GetMapping("product")
	public String index(Model model) {
		Product item = new Product();
		model.addAttribute("item", item);
		List<Product> items = dao.findByIsActivatedTrue();
		model.addAttribute("items", items);
		return "admin/product";
	}

	@GetMapping("/product/edit/{productId}")
	public String edit(Model model, @PathVariable("productId") Integer productId) {
		Product item = dao.findById(productId).orElse(new Product());
		model.addAttribute("item", item);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/product";
	}

//	@PostMapping("/product/create")
//	public String create(@ModelAttribute("item") Product item) {
//		dao.save(item);
//		return "redirect:/admin/product";
//	}

	@PostMapping("/product/update")
	public String update(@ModelAttribute("item") Product item, Productdto itemdto, @RequestParam("categoryId") int categoryId) {
		  LocalDate currentDate = LocalDate.now();
		  Date createDate = Date.from(currentDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
		  item.setCreateDate(createDate);
		  
		  MultipartFile imageFile = itemdto.getImgFile();
	        if (imageFile != null && !imageFile.isEmpty()) {
	            String imageName = imageFile.getOriginalFilename();
	            item.setImage(imageName);
	            
	            try {
	            	String uploadDir = servletContext.getRealPath("/images"); // Đường dẫn thư mục để lưu tệp
	                File uploadDirFile = new File(uploadDir);
	                if (!uploadDirFile.exists()) {
	                    uploadDirFile.mkdirs();
	                }
	                Path filePath = Paths.get(uploadDir, imageName);
	                Files.write(filePath, imageFile.getBytes());
	                
	                System.out.println("Đường dẫn tệp ảnh: " + filePath.toString());
	            } catch (IOException e) {
	                e.printStackTrace();
	                // Xử lý lỗi khi lưu tệp
	            }
	        }
	        Category category = categoryRepository.findById(categoryId)
	                .orElseThrow(() -> new RuntimeException("Category not found"));
	        item.setCategory(category);
		  
		dao.save(item);
		return "redirect:/admin/product";
	}

	@GetMapping("/product/delete/{productId}")
	public String delete(@PathVariable("productId") Integer productId) {
//		dao.deleteById(productId);
		
		
		 Product product = dao.findById(productId).orElse(null);
	        if (product != null) {
	        	product.setStock(false);
	            dao.save(product);
	        }
		return "redirect:/admin/product";
	}

	@RequestMapping("/product/search")
	public String search(Model model,@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		List<Product> items = dao.findByKeywords("%"+kwords+"%");
		model.addAttribute("items", items);
		return "admin/product";
	}
}
