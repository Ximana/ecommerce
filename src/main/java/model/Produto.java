package model;

public class Produto {
	private int codProduto;
	private String nome;
	private String descricao;
	private String codigo;
	private String preco;
	private String categoria;
	private String imagem;
	private String quantidade;
	
      
    public Produto() {
        super();
    }


	public Produto(int codProduto, String nome, String descricao, String codigo, String preco,
			String categoria, String imagem, String quantidade) {
		super();
		this.codProduto = codProduto;
		this.nome = nome;
		this.descricao = descricao;
		this.codigo = codigo;
		this.preco = preco;
		this.categoria = categoria;
		this.imagem = imagem;
		this.quantidade = quantidade;
	}


	public int getCodProduto() {
		return codProduto;
	}


	public void setCodProduto(int codProduto) {
		this.codProduto = codProduto;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public String getPreco() {
		return preco;
	}


	public void setPreco(String preco) {
		this.preco = preco;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public String getImagem() {
		return imagem;
	}


	public void setImagem(String imagem) {
		this.imagem = imagem;
	}


	public String getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}


}
