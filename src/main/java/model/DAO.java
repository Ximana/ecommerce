package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	/* Modulo de conexao **/
	// Paramentro de conexao
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/ecommerce?useTimezone=true&serverTimezone=UTC";

	private String user = "root";
	private String password = "root";

	//Metodo da conexao
	private Connection conectar() {
		Connection con = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;

		} catch (Exception e) {
			System.out.println(e);
			return null;

		}

	}

	// CRUD CREATE cliente na BD
	public void novoCliente(Cliente cliente) {
		String query = "insert into usuario (Email, Senha, Nome, Apelido, NumTelefone, Pais, Cidade, Endereco, Genero) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			// Abrir a conexao
			Connection con = conectar();
			// preparar a query para execucao
			PreparedStatement pst = con.prepareStatement(query);
			// substituir os parametros(interrogacoes) pelo conteudo das variaveis
			pst.setString(1, cliente.getEmail());
			pst.setString(2, cliente.getSenha());
			pst.setString(3, cliente.getNome());
			pst.setString(4, cliente.getApelido());
			pst.setString(5, cliente.getNumTelefone());
			pst.setString(6, cliente.getPais());
			pst.setString(7, cliente.getCidade());
			pst.setString(8, cliente.getEndereco());
			pst.setString(9, cliente.getGenero());

			// executar a query
			pst.executeUpdate();
			// encerrar a conexao
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// CRUD READ cliente na BD
	public ArrayList<Cliente> listarClientes() {
		// Objecto para acessar a classe JavaBeans
		ArrayList<Cliente> clientes = new ArrayList<>();
		String query = "select * from usuario order by Nome";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet resultado = pst.executeQuery();

			// Laco para pegar todos os clientes
			while (resultado.next()) {
				String cod = resultado.getString(1);
				String email = resultado.getString(2);
				String senha = resultado.getString(3);
				String nome = resultado.getString(4);
				String apelido = resultado.getString(5);
				String telefone = resultado.getString(6);
				String pais = resultado.getString(7);
				String cidade = resultado.getString(8);
				String endereco = resultado.getString(9);
				String genero = resultado.getString(10);
				String DataCriacao = resultado.getString(11);
				String DataAlteracao = resultado.getString(12);

				clientes.add(new Cliente(cod, email, senha, nome, apelido, telefone, pais, cidade, endereco, genero,
						DataCriacao, DataAlteracao));

			}
			con.close();
			return clientes;

		} catch (Exception e) {
			return null;
		}

	}

	// CRUD CREATE produto na BD
	public void novoProduto(Produto produto) {
		String query = "insert into produto (nome, descricao, codigo, preco, categoria, imagem, quantidade) values (?, ?, ?, ?, ?, ?, ?)";

		try {
			// Abrir a conexao
			Connection con = conectar();
			// preparar a query para execucao
			PreparedStatement pst = con.prepareStatement(query);
			// substituir os parametros(interrogacoes) pelo conteudo das variaveis
			pst.setString(1, produto.getNome());
			pst.setString(2, produto.getDescricao());
			pst.setString(3, produto.getCodigo());
			pst.setString(4, produto.getPreco());
			pst.setString(5, produto.getCategoria());
			pst.setString(6, produto.getImagem());
			pst.setString(7, produto.getQuantidade());

			// executar a query
			pst.executeUpdate();
			// encerrar a conexao
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// CRUD READ produto na BD
	public ArrayList<Produto> listarProduto() {
		// Objecto para acessar a classe JavaBeans
		ArrayList<Produto> produtos = new ArrayList<>();
		String query = "select * from produto order by nome";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet resultado = pst.executeQuery();

			// Laco para pegar todos os clientes
			while (resultado.next()) {
				int cod = Integer.parseInt(resultado.getString(1));// converte a string em int
				String nome = resultado.getString(2);
				String descricao = resultado.getString(3);
				String codigo = resultado.getString(4);
				String preco = resultado.getString(5);
				String categoria = resultado.getString(6);
				String imagem = resultado.getString(7);
				String quantidade = resultado.getString(8);

				produtos.add(new Produto(cod, nome, descricao, codigo, preco, categoria, imagem, quantidade));
			}
			con.close();
			return produtos;

		} catch (Exception e) {
			return null;
		}

	}

	// CRUD READ produto na BD
	public Produto produtoSelecionado(String codigoProduto) {
		// Objecto para acessar a classe JavaBeans
		Produto produto = new Produto();
		String query = "select * from produto where codProduto = ?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, codigoProduto);
			ResultSet resultado = pst.executeQuery();

			// Laco para pegar todos os clientes
			while (resultado.next()) {
				produto.setCodProduto(Integer.parseInt(resultado.getString(1)));
				produto.setNome(resultado.getString(2));
				produto.setDescricao(resultado.getString(3));
				produto.setCodigo(resultado.getString(4));
				produto.setPreco(resultado.getString(5));
				produto.setCategoria(resultado.getString(6));
				produto.setImagem(resultado.getString(7));
				produto.setQuantidade(resultado.getString(8));

			}
			con.close();
			return produto;

		} catch (Exception e) {
			return null;
		}

	}

//____________________________________________________________________________________________________
	// Inseriri novo pedido
	public void novoItemPedido(ItemPedido item) {

		String query = "INSERT INTO itens_pedido ( id_produto, id_pedido, quantidade, hora, data) VALUES (?, ?, ?, current_time(), current_date())";

		try {
			// Abrir a conexao
			Connection con = conectar();
			// preparar a query para execucao
			PreparedStatement pst = con.prepareStatement(query);
			// substituir os parametros(interrogacoes) pelo conteudo das variaveis
			pst.setString(1, item.getCodProduto());
			pst.setString(2, item.getCodPedido());
			pst.setString(3, item.getQuantidade());

			// executar a query
			pst.executeUpdate();
			// encerrar a conexao
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public String verificarCodigoPedidoPendente(String idUsuario) {

		String idPedido = "";
		String query = "select max(codigo) from pedido where id_cliente = ? and estado = 'Pendente'";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idUsuario);
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				idPedido = resultado.getString(1);
			}
			/*
			 * if (idPedido.equals(null)) { //novoPedido("1"); idUsuario = "1"; idPedido =
			 * pegarCodigoDoUltimoPedido(idUsuario); }
			 */

			con.close();
			System.out.println("Codddd: " + idPedido);
			return idPedido;

		} catch (Exception e) {

			System.out.println("Null: ");
			return null;
		}

	}

	public void novoPedido(String idUsuario) {

		String query = "INSERT INTO ecommerce.pedido (id_cliente, data, estado) VALUES (?, current_date(), 'Pendente')";
		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idUsuario);

			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// ______________________________________________________________________________________

	// CRUD READ carrinho
	public ArrayList<Carrinho> carrinhoVer(String idUsuario) {
		// Objecto para acessar a classe JavaBeans
		ArrayList<Carrinho> carrinho = new ArrayList<>();

		String query = "select produto.codProduto, produto.nome, produto.descricao, produto.preco, produto.categoria, itens_pedido.quantidade, itens_pedido.data, itens_pedido.hora, itens_pedido.codigo from itens_pedido inner join produto on produto.codProduto = itens_pedido.id_produto inner join pedido on itens_pedido.id_pedido = pedido.codigo inner join usuario on pedido.id_cliente = usuario.CodUsuario where usuario.CodUsuario = "
				+ idUsuario + " and pedido.estado = 'Pendente' order by produto.nome";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet resultado = pst.executeQuery();

			// Laco para pegar todos os clientes
			while (resultado.next()) {
				int cod = Integer.parseInt(resultado.getString(1));
				String nome = resultado.getString(2);
				String descricao = resultado.getString(3);
				String preco = resultado.getString(4);
				String categoria = resultado.getString(5);
				String quantidade = resultado.getString(6);
				String data = resultado.getString(7);
				String hora = resultado.getString(8);
				String codItemPedido = resultado.getString(9);

				carrinho.add(
						new Carrinho(cod, nome, descricao, preco, categoria, quantidade, data, hora, codItemPedido));

			}
			con.close();
			return carrinho;

		} catch (Exception e) {
			return null;
		}

	}

	// CRUD READ produto na BD
	public ArrayList<Produto> pesquisa(String pesquisa) {
		// Objecto para acessar a classe JavaBeans
		ArrayList<Produto> produtos = new ArrayList<>();
		String query = "select * from produto where nome like '%" + pesquisa + "%' order by nome";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet resultado = pst.executeQuery();

			// Laco para pegar todos os clientes
			while (resultado.next()) {
				int cod = Integer.parseInt(resultado.getString(1));// converte a string em int
				String nome = resultado.getString(2);
				String descricao = resultado.getString(3);
				String codigo = resultado.getString(4);
				String preco = resultado.getString(5);
				String categoria = resultado.getString(6);
				String imagem = resultado.getString(7);
				String quantidade = resultado.getString(8);

				produtos.add(new Produto(cod, nome, descricao, codigo, preco, categoria, imagem, quantidade));
			}
			con.close();
			return produtos;

		} catch (Exception e) {
			return null;
		}

	}

	public void removerDoCarrinho(String id) {
		String query = "delete from itens_pedido where codigo=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, id);
			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void compra(String idUsuario) {

		String idPedido = pegarCodigoDoUltimoPedido(idUsuario);
		String query = "UPDATE ecommerce.pedido SET estado = 'Feito' WHERE codigo = ?  and id_cliente = ?";

		System.out.println("Usuario: " + idUsuario);
		System.out.println("Pedido: " + idPedido);

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idPedido);
			pst.setString(2, idUsuario);
			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	// Pegar o numero de produtos no carrinho do usuario
	public int totalProdutos(String idUsuario) {

		int totalProdutos = 0;
		String query = "select count(produto.codProduto) from itens_pedido " + "inner join produto"
				+ " on produto.codProduto = itens_pedido.id_produto" + " inner join pedido"
				+ " on itens_pedido.id_pedido = pedido.codigo " + "inner join usuario"
				+ " on pedido.id_cliente = usuario.CodUsuario"
				+ " where usuario.CodUsuario = ? and pedido.estado = 'Pendente'";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idUsuario);
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				totalProdutos = Integer.parseInt(resultado.getString(1));

			}
			con.close();
			return totalProdutos;

		} catch (Exception e) {
			return 0;
		}

	}

	public String pegarCodigoDoUltimoPedido(String idUsuario) {

		String idPedido = "";
		String query = "select max(codigo) from pedido where id_cliente = ?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idUsuario);
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				idPedido = resultado.getString(1);

			}
			con.close();
			return idPedido;

		} catch (Exception e) {
			return null;
		}

	}

	// ver Favoritos
	public ArrayList<Produto> verFavorito(String usuario) {
		ArrayList<Produto> produtos = new ArrayList<>();
		String query = "select * from produto inner join favoritos on produto.codProduto = favoritos.id_produto inner join usuario on favoritos.id_usuario = usuario.CodUsuario where usuario.CodUsuario = ?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, usuario);
			ResultSet resultado = pst.executeQuery();

			while (resultado.next()) {
				int cod = Integer.parseInt(resultado.getString(1));// converte a string em int
				String nome = resultado.getString(2);
				String descricao = resultado.getString(3);
				String codigo = resultado.getString(4);
				String preco = resultado.getString(5);
				String categoria = resultado.getString(6);
				String imagem = resultado.getString(7);
				String quantidade = resultado.getString(8);

				produtos.add(new Produto(cod, nome, descricao, codigo, preco, categoria, imagem, quantidade));
			}
			con.close();
			return produtos;

		} catch (Exception e) {
			return null;
		}

	}
	
	//Adicionar Favorito
	public void novoFavorito(String idUsuario, String idProduto) {

		String query = "INSERT INTO ecommerce.favoritos (id_produto, id_usuario) VALUES (?, ?)";
		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, idProduto);
			pst.setString(2, idUsuario);
			

			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
