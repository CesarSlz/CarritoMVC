package com.barbaro.store.models;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Cart {

	private Map<Product, Integer> elementos;
	
	public Cart(Map<Product, Integer> elementos) {
		this.elementos = elementos;
	}
	
	public Map<Product, Integer> getElementos(){
		return this.elementos;
	}
	
	public void setElementos(Map<Product, Integer> elementos) {
		this.elementos = elementos;
	}
	
	public void agregarElemento(Product product) {
		if(elementos.containsKey(product)) {
			elementos.put(product, elementos.get(product)+1);
		}else {
			elementos.put(product, 1);
		}
	}
	
	public boolean eliminarElemento(Product product) {
		// buscar por id
		// checar el producto
		int cantidadAnt = contarProducto();
		if(elementos.containsKey(product)) {
			elementos.remove(product);
		}
		return cantidadAnt>contarProducto();
	}
	
	public int contarProducto() {
		int cantidad = 0;
		// Obtener todas las cantidades (valores)
		Collection<Integer> cantidades = elementos.values();
		
		for(Integer integer: cantidades) {
			cantidad += integer;
		}
		
		return cantidad;	
	}
	
	public void reducirCantidadElemento(Product product) {
		if(elementos.containsKey(product)) {
			if(elementos.get(product) > 1) {
				elementos.put(product, elementos.get(product)-1);
			}else {
				eliminarElemento(product);
			}
		}
	}
	
	public void limpiar() {
		elementos.clear();
	}
	
	public float calcularTotal() {
		float total = 0;
		Set<Product> llaves = elementos.keySet();
		for(Product product: llaves) {
			total += product.getPrecio() * elementos.get(product);
		}
		return total;
	}
	
	
}
