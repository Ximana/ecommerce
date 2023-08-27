package model;

public class Cliente {
	private String codUsuario;
	private String email;	
	private String senha;
	private String nome;
	private String apelido;
	private String numTelefone;
	private String pais;	
	private String cidade;	
	private String endereco;
	private String genero;	
	private String dataCriacao;	
	private String dataAlteracao;
	
	
	
	public Cliente() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Cliente(String codUsuario, String email, String senha, String nome, String apelido, String numTelefone,
			String pais, String cidade, String endereco, String genero, String ataCriacao, String ataAlteracao) {
		super();
		this.codUsuario = codUsuario;
		this.email = email;
		this.senha = senha;
		this.nome = nome;
		this.apelido = apelido;
		this.numTelefone = numTelefone;
		this.pais = pais;
		this.cidade = cidade;
		this.endereco = endereco;
		this.genero = genero;
		this.dataCriacao = ataCriacao;
		this.dataAlteracao = ataAlteracao;
	}



	public String getCodUsuario() {
		return codUsuario;
	}
	public void setCodUsuario(String codUsuario) {
		this.codUsuario = codUsuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getApelido() {
		return apelido;
	}
	public void setApelido(String apelido) {
		this.apelido = apelido;
	}
	public String getNumTelefone() {
		return numTelefone;
	}
	public void setNumTelefone(String numTelefone) {
		this.numTelefone = numTelefone;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public String getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(String ataCriacao) {
		this.dataCriacao = ataCriacao;
	}
	public String getDataAlteracao() {
		return dataAlteracao;
	}
	public void setDataAlteracao(String ataAlteracao) {
		this.dataAlteracao = ataAlteracao;
	}	
	
	


}
