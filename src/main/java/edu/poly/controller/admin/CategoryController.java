package edu.poly.controller.admin;

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

import edu.poly.domain.Category;
import edu.poly.repository.CategoryRepository;
import edu.poly.service.SessionService;

@Controller
@RequestMapping("admin")
public class CategoryController {
	@Autowired
	CategoryRepository dao;

	@Autowired
	SessionService session;
	
	@RequestMapping("category")
	public String index(Model model) {
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = dao.findByIsActivatedTrue();
		model.addAttribute("items", items);
		return "admin/category";
		
	}

	@GetMapping("/category/edit/{categoryId}")
	public String edit(Model model, @PathVariable("categoryId") Integer categoryId) {
		Category item = dao.findById(categoryId).orElse(new Category());
		model.addAttribute("item", item);
		List<Category> items = dao.findByIsActivatedTrue();
		model.addAttribute("items", items);
		return "admin/category";
	}



	@PostMapping("/category/update")
	public String update(@ModelAttribute("item") Category item, Model model) {
		item.setActivated(true);
		dao.save(item);
		return "redirect:/admin/category";
	}

	@GetMapping("/category/delete/{categoryId}")
	public String delete(@PathVariable("categoryId") Integer categoryId) {
//		dao.deleteById(categoryId);
		
		Category category = dao.findById(categoryId).orElse(null);
        if (category != null) {
        	category.setActivated(false);
            dao.save(category);
        }
		return "redirect:/admin/category";
	}

	
	@RequestMapping("/category/search")
	public String search(Model model,@RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		List<Category> items = dao.findByKeywords("%"+kwords+"%");
		model.addAttribute("items", items);
		return "admin/category";
	}
}
