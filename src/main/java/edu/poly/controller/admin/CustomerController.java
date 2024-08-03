package edu.poly.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import edu.poly.domain.Customer;
import edu.poly.dto.Customerdto;
import edu.poly.repository.CustomerRepository;
import jakarta.servlet.ServletContext;

@Controller("adminCustomerController")
@RequestMapping("admin")
public class CustomerController {
	@Autowired
	CustomerRepository dao;
	
	@Autowired
	private ServletContext servletContext;

	@GetMapping("customer")
	public String index(Model model) {
		Customer item = new Customer();
		model.addAttribute("item", item);
		List<Customer> items = dao.findByIsActivatedTrue();
		model.addAttribute("items", items);
		return "admin/customer";
	}

	@GetMapping("/customer/edit/{customerId}")
	public String edit(Model model, @PathVariable("customerId") Integer customerId) {
		Customer item = dao.findById(customerId).orElse(new Customer());
		model.addAttribute("item", item);
		List<Customer> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/customer";
	}

//	@PostMapping("/customer/create")
//	public String create(@ModelAttribute("item") Customer item) {
//		dao.save(item);
//		return "redirect:/admin/customer";
//	}

	@PostMapping("/customer/update")
	public String update(@ModelAttribute("item") Customer item, Customerdto itemdto) {
		
		
		MultipartFile imageFile = itemdto.getImgFile();
        if (imageFile != null && !imageFile.isEmpty()) {
            String imageName = imageFile.getOriginalFilename();
            item.setPhoto(imageName);
            
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
		
		
		
		
		
		
		
		
		
		dao.save(item);
		return "redirect:/admin/customer";
	}

	@GetMapping("/customer/delete/{customerId}")
	public String delete(@PathVariable("customerId") Integer customerId) {
//		dao.deleteById(customerId);
		
		 Customer customer = dao.findById(customerId).orElse(null);
	        if (customer != null) {
	            customer.setIsActivated(false);
	            dao.save(customer);
	        }
		return "redirect:/admin/customer";
	}

}
