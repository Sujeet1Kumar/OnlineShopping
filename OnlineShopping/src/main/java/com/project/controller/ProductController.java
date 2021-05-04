package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.ProductDao;
import com.project.model.Cart;
import com.project.model.Orders;
import com.project.model.Product;
import com.project.model.User;

@Controller
public class ProductController {

	@Autowired
	private ProductDao productDao;

	@PostMapping("/add")
	public String addBook(@RequestParam("imagefile") MultipartFile file, Product product, HttpSession session)
			throws IOException {
		System.out.println(file.getSize());
		System.out.println(product);
		// file upload here
		String rootlocation = session.getServletContext().getRealPath("/");
		System.out.println(rootlocation);
		File folder = new File(rootlocation, "productimages");
		if (!folder.exists())
			folder.mkdir();
		File myFile = File.createTempFile("product", ".jpg", folder);
		System.out.println(myFile.getAbsolutePath());
		file.transferTo(myFile);

		String filename = myFile.getName();
		System.out.println(filename);
		// then add data into database
		product.setProductimage(filename);

		productDao.insert(product);
		return "redirect:/show";
	}

	@GetMapping("/show")
	public String show(HttpSession hs) {
		List<Product> products = productDao.getAllProducts();
		hs.setAttribute("products", products);
		return "showproduct";
	}

	@PostMapping("/delete")
	public String delete(Product product) {
		System.out.println(product.getProductid() + "\t" + product.getDescription() + "\t" + product.getProductname()
				+ "\t" + product.getProductprice() + "\t" + product.getProductimage() + "\t" + product.getSellerid()
				+ "\t" + product.getSellername());
		int i = productDao.delete(product);
		return "showproduct";
	}

}
