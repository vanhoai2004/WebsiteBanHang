package edu.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.dto.Report;
import edu.poly.repository.ProductRepository;



@Controller("adminHomeController")
@RequestMapping("admin")
public class HomeController {
	@Autowired
	ProductRepository dao;
	
	@GetMapping("home")
	public String index(Model model) {
		List<Report> items = dao.getInventoryByCategory();
		model.addAttribute("items", items);
		return"admin/index";
	}
	
}
