package br.org.desafio.pagamento.teste;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class PagamentoTeste {

	@Test
	public void deveriaSomarValorFilmes() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(1);
		carrinho.add(5);
		
		Pagamento pagamento = new Pagamento();
		
		double somatorio = pagamento.somatorio(carrinho);
		double expected = 145.0d;
		
		assertTrue(somatorio == expected);
	}
	
	@Test
	public void naoDeveriaConterFilmeAcao() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(1);
		carrinho.add(5);
		carrinho.add(2);
		carrinho.add(6);
		carrinho.add(1);
		
		Pagamento pagamento = new Pagamento();

		boolean naoContem = pagamento.contemFilmeAcao(carrinho);
		
		assertFalse(naoContem);
	}
	
	@Test
	public void deveriaAplicarDesconto10Perc() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(1);
		carrinho.add(5);
		
		Pagamento pagamento = new Pagamento();

		double somatorio = pagamento.somatorio(carrinho);
		double totalPagar = pagamento.totalPagar(carrinho);
		double expected = somatorio - ((somatorio*10.0d)/100.0d);
		
		assertTrue(totalPagar == expected);
	}
	
	@Test
	public void deveriaAplicarDesconto20Perc() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(2);
		carrinho.add(6);
		
		Pagamento pagamento = new Pagamento();

		double somatorio = pagamento.somatorio(carrinho);
		double totalPagar = pagamento.totalPagar(carrinho);
		double expected = somatorio - ((somatorio*20.0d)/100.0d);
		
		assertTrue(totalPagar == expected);
	}
	
	@Test
	public void deveriaAplicarDesconto25Perc() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(2);
		carrinho.add(6);
		carrinho.add(5);
		
		Pagamento pagamento = new Pagamento();

		double somatorio = pagamento.somatorio(carrinho);
		double totalPagar = pagamento.totalPagar(carrinho);
		double expected = somatorio - ((somatorio*25.0d)/100.0d);
		
		assertTrue(totalPagar == expected);
	}
	
	@Test
	public void deveriaAplicarDesconto30Perc() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(2);
		carrinho.add(6);
		carrinho.add(5);
		carrinho.add(5);
		
		Pagamento pagamento = new Pagamento();

		double somatorio = pagamento.somatorio(carrinho);
		double totalPagar = pagamento.totalPagar(carrinho);
		double expected = somatorio - ((somatorio*30.0d)/100.0d);
		
		assertTrue(totalPagar == expected);
	}
	
	@Test
	public void deveriaAplicarDesconto5Perc() throws Exception {
		List<Integer> carrinho = new ArrayList<Integer>();
		carrinho.add(4);
		
		Pagamento pagamento = new Pagamento();

		double somatorio = pagamento.somatorio(carrinho);
		double totalPagar = pagamento.totalPagar(carrinho);
		double expected = somatorio - ((somatorio*5.0d)/100.0d);
		
		assertTrue(totalPagar == expected);
		
		carrinho.clear();
		carrinho.add(6);
		carrinho.add(6);
		carrinho.add(3);
		
		somatorio = pagamento.somatorio(carrinho);
		totalPagar = pagamento.totalPagar(carrinho);
		expected = somatorio - ((somatorio*30.0d)/100.0d) - ((somatorio*5.0d)/100.0d);
	}

}
