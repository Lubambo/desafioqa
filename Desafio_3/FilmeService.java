package br.org.desafio.pagamento.teste;

import java.util.ArrayList;
import java.util.List;

public class FilmeService {
	
	private List<Filme> filmes;
	
	public FilmeService() {
		filmes = new ArrayList<Filme>();
		filmes.add(new Filme(1, "Senhor dos Anéis", "Fantasia", 45.0d));
		filmes.add(new Filme(2, "As Branquelas", "Comédia", 55.0d));
		filmes.add(new Filme(3, "Velozes e Furiosos 7", "Ação", 100.0d));
		filmes.add(new Filme(4, "Velozes e Furiosos 6", "Ação", 55.0d));
		filmes.add(new Filme(5, "The Scapegoat", "Drama", 100.0d));
		filmes.add(new Filme(6, "Meu Malvado Favorito", "Animação", 200.0d));
	}

	public List<Filme> getFilmes() { return filmes; }

	
}
