package br.org.desafio.pagamento.teste;

import java.util.List;

public class Pagamento {
	
	public Pagamento(){
	}
	
	public double somatorio(List<Integer> items) {
		double resultado = 0.0d;
		
		List<Filme> filmes = (new FilmeService()).getFilmes();
		
		for(int item : items) {
			for(Filme filme : filmes) {
				if(item == filme.getId()) {
					resultado += filme.getValor();
				}
			}
		}
		
		return resultado;
	}
	
	public boolean contemFilmeAcao(List<Integer> items) {
		boolean contains = false;
		
		List<Filme> filmes = (new FilmeService()).getFilmes();
		
		outerloop:
		for(int item : items) {
			for(Filme filme : filmes) {
				if(item == filme.getId()) {
					if("Ação" == filme.getGenero()) {
						contains = true;
						break outerloop;
					}
				}
			}
		}
		
		return contains;
	}
	
	private double aplicar5PercDesconto(double valor) {
		return valor * 5.0d / 100.0d;
	}
	
	private double aplicar10PercDesconto(double valor) {
		return valor * 10.0d / 100.0d;
	}
	
	private double aplicar20PercDesconto(double valor) {
		return valor * 20.0d / 100.0d;
	}
	
	private double aplicar25PercDesconto(double valor) {
		return valor * 25.0d / 100.0d;
	}
	
	private double aplicar30PercDesconto(double valor) {
		return valor * 30.0d / 100.0d;
	}
	
	public double totalPagar(List<Integer> items) {
		double somatorio = this.somatorio(items);
		double desconto = 0.0d;

		if(somatorio > 100 && somatorio < 200) {
			desconto = aplicar10PercDesconto(somatorio);
		}
		else if(somatorio > 200 && somatorio < 300) {
			desconto = aplicar20PercDesconto(somatorio);
		}
		else if(somatorio > 300 && somatorio < 400) {
			desconto = aplicar25PercDesconto(somatorio);
		}
		else if(somatorio >= 400) {
			desconto = aplicar30PercDesconto(somatorio);
		}
		
		double acaoDesconto = 0.0d;
		if(this.contemFilmeAcao(items)) {
			acaoDesconto = aplicar5PercDesconto(somatorio);
		}
		
		double total = somatorio - desconto - acaoDesconto;
		
		return total;
	}

}