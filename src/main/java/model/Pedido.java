package model;

import java.util.Date;

public class Pedido {

	private int codigo;
	private int codUsuario;
	private String observacao;
	private String data;
	private String estado;

	
	
	public Pedido(int id, int idUsuario, String observacao, String data, String estado) {
		super();
		this.codigo = id;
		this.codUsuario = idUsuario;
		this.observacao = observacao;
		this.data = data;
		this.estado = estado;
	}

	public Pedido() {
		super();
	}

	public int getId() {
		return codigo;
	}

	public void setId(int id) {
		this.codigo = id;
	}

	public int getIdUsuario() {
		return codUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.codUsuario = idUsuario;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

}
