package model;

public class ItemPedido {
	private String codigo;
	private String codProduto;
	private String codPedido;
	private String quantidade;
	private String data;
	private String hora;
	
	
	
	
	public ItemPedido(String codigo, String codProduto, String codPedido, String quantidade, String data, String hora) {
		super();
		this.codigo = codigo;
		this.codProduto = codProduto;
		this.codPedido = codPedido;
		this.quantidade = quantidade;
		this.data = data;
		this.hora = hora;
	}




	public ItemPedido() {
		super();

	}




	public String getCodigo() {
		return codigo;
	}




	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}




	public String getCodProduto() {
		return codProduto;
	}




	public void setCodProduto(String codProduto) {
		this.codProduto = codProduto;
	}




	public String getCodPedido() {
		return codPedido;
	}




	public void setCodPedido(String codPedido) {
		this.codPedido = codPedido;
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
	
	


}
