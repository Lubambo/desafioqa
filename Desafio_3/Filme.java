package br.org.desafio.pagamento.teste;

public class Filme {
	
	private int id;
	private String nome;
	private String genero;
	private double valor;
	
	public Filme(int id, String nome, String genero, double valor) {
		super();
		this.id = id;
		this.nome = nome;
		this.genero = genero;
		this.valor = valor;
	}

	public int getId() { return id; }

	public void setId(int id) { this.id = id; }

	public String getNome() { return nome; }

	public void setNome(String nome) { this.nome = nome; }

	public String getGenero() { return genero; }

	public void setGenero(String genero) { this.genero = genero; }

	public double getValor() { return valor; }

	public void setValor(double valor) { this.valor = valor; }
	
	
	
}
