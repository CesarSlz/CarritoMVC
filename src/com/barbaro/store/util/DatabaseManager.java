package com.barbaro.store.util;

import java.util.ArrayList;
import java.util.List;

import com.barbaro.store.models.Product;

public class DatabaseManager {

	public static List<Product> getProducts(){
		List<Product> products = new ArrayList<>();
		
		Product camisa = new Product(1, "Camisa", "Camisa de color rojo con figuritas", 200);
		Product tennis = new Product(2, "Tenis Vans", "De cuadritos negros", 800);
		Product computadora = new Product(3, "HP Envy", "Poderosa y ligera", 22000);
		Product play = new Product(4, "Play Station 4", "Consola para shavos", 5500);
		Product tazon = new Product(5, "Tazon", "Tazon para corn fleis", 50);
		
		products.add(camisa);
		products.add(tennis);
		products.add(computadora);
		products.add(play);
		products.add(tazon);
		
		return products;
		
	}
	
	public static Product getProduct(String id) {
		
		List<Product> products = getProducts();
		int idProduct = Integer.parseInt(id);
		
		for(Product productAux: products) {
			if(productAux.getId() == idProduct) {
				return productAux; // lo encontro
			}
		}
		return null; // no lo encontro
	}
}
