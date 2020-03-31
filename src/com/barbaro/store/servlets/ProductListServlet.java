package com.barbaro.store.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.barbaro.store.models.Cart;
import com.barbaro.store.models.Product;
import com.barbaro.store.util.DatabaseManager;

@WebServlet(name="ProductList", urlPatterns={"/"})
public class ProductListServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		// Obtener modelos de informacion
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart == null) {
			session.setAttribute("cart", new Cart(new HashMap<Product, Integer>()));
		}
		
		List<Product> products = DatabaseManager.getProducts();
		RequestDispatcher dispatcher = req.getRequestDispatcher("products.jsp");
		req.setAttribute("products", products);
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
