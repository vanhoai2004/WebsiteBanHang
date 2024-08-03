package edu.poly.controller.admin;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.domain.Customer;
import edu.poly.domain.Order;
import edu.poly.repository.OrderRepository;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class OrderController {

	@Autowired
	OrderRepository dao;
	

	
	@GetMapping("order")
	public String index(Model model) {
		Order item = new Order();
		model.addAttribute("item", item);
		List<Order> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/order";
	}
	
	@PostMapping("/order/create")
	public String create(@ModelAttribute("item") Order item, @RequestParam("totalAmount") double totalAmount, HttpSession session) {
		Customer user = (Customer) session.getAttribute("user");
		try {
			item.setCustomer(user);
			item.setStatus((short)1);
			item.setOrderDate(Calendar.getInstance().getTime());
			item.setAmount(totalAmount);
			dao.save(item);
			return "redirect:/site/checkout";
		} catch (Exception e) {
			return "redirect:/site/404";
		}
		
	}
	
	
	@PostMapping("/order/update")
	public String update(@ModelAttribute("item") Order item) {
		dao.save(item);
		return "redirect:/admin/order";
	}
}
