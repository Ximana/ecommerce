package model;

public class Carrinho extends Produto {
	
	String quantidade;
	String data;
	String hora;
	String codItemPedido;
	
	public Carrinho(int codProduto, String nome, String descricao, String preco, String categoria,
		 String quantidade, String data, String hora, String codItemPedido) {
		this.quantidade = quantidade;
		this.data = data;
		this.hora = hora;
		this.codItemPedido = codItemPedido;
		
		this.setCodProduto(codProduto);
		this.setNome(nome);
		this.setDescricao(descricao);
		this.setPreco(preco);
		this.setCategoria(categoria);

	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public String getCodItemPedido() {
		return codItemPedido;
	}

	public void setCodItemPedido(String codItemPedido) {
		this.codItemPedido = codItemPedido;
	}
	
	
	
	

}
