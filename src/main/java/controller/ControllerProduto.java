package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.xml.sax.InputSource;

import com.mysql.cj.Session;

import model.Carrinho;
import model.DAO;
import model.ItemPedido;
import model.Produto;

@WebServlet(urlPatterns = { "/ControllerProduto", "/admin/novoProduto", "/admin/listarProdutos", "/loja",
		"/produtoSelecionado", "/admin/vendas", "/adicionarAoCarrinho", "/verCarrinho", "/removerCarrinho",
		"/pesquisa", "/compra", "/adicionarP", "/verFavorito", "/adicionarFavorito" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1mb
		maxFileSize = 1024 * 1024 * 10, // 10mb
		maxRequestSize = 1024 * 1024 * 100 // 100mb
)
public class ControllerProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	Produto produto = new Produto();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();
		if (action.equals("/admin/novoProduto")) {

			// -------------------Upload da imagem--------------------
			// String uploadDir = "C:/PX/teste/";
			String uploadDir = "C:/Users/XM/eclipse-workspace/ecommerce/src/main/webapp/assets/img/produtos/";
			Part filePart = request.getPart("imagem");
			String fileName = filePart.getSubmittedFileName();
			String filePath = uploadDir + File.separator + fileName;
			filePart.write(filePath);
			// response.getWriter().println("Rquivo enviado co sucesso");
			// --------------------------------------------------

			// salvarImagem(request, response);
			novoProdutos(request, response, fileName);
			// uploadImage(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		// System.out.println(action);

		if (action.equals("/admin/novoProduto")) {

			// novoProdutos(request, response);
		} else if (action.equals("/admin/listarProdutos")) {
			listarProdutos(request, response);

		} else if (action.equals("/admin/vendas")) {
			vendas(request, response);
		} else if (action.equals("/loja")) {
			listarProdutosNaLoja(request, response);
		} else if (action.equals("/produtoSelecionado")) {
			produtoSelecionado(request, response);
		} else if (action.equals("/adicionarAoCarrinho")) {
			adicionarAoCarrinho(request, response);
		} else if (action.equals("/removerCarrinho")) {
			removerCarrinho(request, response);
		} else if (action.equals("/verCarrinho")) {
			verCarrinho(request, response);
		} else if (action.equals("/pesquisa")) {
			pesquisa(request, response, action);
		}  else if (action.equals("/compra")) {
			compra(request, response);
		}else if (action.equals("/adicionarP")) {
			adicionarAoCarro(request, response);
		}else if (action.equals("/verFavorito")) {
			verFavorito(request, response);
		}
		else if (action.equals("/adicionarFavorito")) {
			novoFavorito(request, response);
		}else {
			response.sendRedirect("index.jsp");
		}
	}
	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub doGet(request, response); }
	 */

	protected void novoProdutos(HttpServletRequest request, HttpServletResponse response, String nomeImagem)
			throws ServletException, IOException {
		// o objecto produto recebe os parametros passados
		produto.setNome(request.getParameter("nome"));
		produto.setDescricao(request.getParameter("descricao"));
		produto.setCodigo(request.getParameter("codigo"));
		produto.setPreco(request.getParameter("preco"));
		produto.setCategoria(request.getParameter("categoria"));
		produto.setImagem(nomeImagem);
		produto.setQuantidade(request.getParameter("quantidade"));

		// Inserir na BD com o objecto DAO
		dao.novoProduto(produto);
		// redirecionar para o documento "index.jsp"
		response.sendRedirect("index.jsp");
	}

	protected void listarProdutos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Criar objecto para receber os dados dos produto
		ArrayList<Produto> listaProdutos = dao.listarProduto();

		// enviar a lista de produtos para listarProduto.jsp
		request.setAttribute("listaProdutos", listaProdutos);
		RequestDispatcher rd = request.getRequestDispatcher("listarProduto.jsp");
		rd.forward(request, response);

	}

	protected void listarProdutosNaLoja(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Criar objecto para receber os dados dos produto
		ArrayList<Produto> listaProdutos = dao.listarProduto();

		// enviar a lista de produtos para listarProduto.jsp
		request.setAttribute("listaProdutos", listaProdutos);
		RequestDispatcher rd = request.getRequestDispatcher("loja.jsp");
		rd.forward(request, response);

		// response.sendRedirect("loja.jsp");
	}

	protected void vendas(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("vendas.jsp");

	}

	protected void adicionarAoCarrinho(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String codigoProduto = request.getParameter("codigo");
		//String codigoPedido = "1";

		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setCodPedido(dao.verificarCodigoPedidoPendente("1"));
		itemPedido.setCodProduto(codigoProduto);
		itemPedido.setQuantidade("2");
		
		if (itemPedido.getCodPedido() == null) {
			dao.novoPedido("1");
			//System.out.println("id e Nulo");
			itemPedido.setCodPedido(dao.pegarCodigoDoUltimoPedido("1"));
			//System.out.println("id ultimo pedido: " + itemPedido.getCodPedido());
		} 
		
		//System.out.println("id pedido: " + itemPedido.getCodPedido());

		dao.novoItemPedido(itemPedido);

		// System.out.println("produto " + codigoProduto);
		// System.out.println("usuario " + codigoUsuario);

		RequestDispatcher rd = request.getRequestDispatcher("loja");
		rd.forward(request, response);
	}
//_____________________________________________
	
	protected void adicionarAoCarro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Ola mjunsod");
		
		String codigoProduto = request.getParameter("idProduto");
		String codigoUsuario = request.getParameter("idUsuario");
		String quantidade = request.getParameter("quantidade");
		
		/*
		System.out.println("Ola mjunsod");
		System.out.println("Id Pro: " + codigoProduto);
		System.out.println("Id Udsuario: " + codigoUsuario);
		System.out.println("Quantidade: " + quantidade);
*/
		
		ItemPedido itemPedido = new ItemPedido();
		itemPedido.setCodPedido(dao.verificarCodigoPedidoPendente(codigoUsuario));
		itemPedido.setCodProduto(codigoProduto);
		itemPedido.setQuantidade(quantidade);
		
		if (itemPedido.getCodPedido() == null) {
			dao.novoPedido(codigoUsuario);
			//System.out.println("id e Nulo");
			itemPedido.setCodPedido(dao.pegarCodigoDoUltimoPedido(codigoUsuario));
			//System.out.println("id ultimo pedido: " + itemPedido.getCodPedido());
		} 
		
		//System.out.println("id pedido: " + itemPedido.getCodPedido());

		dao.novoItemPedido(itemPedido);

		// System.out.println("produto " + codigoProduto);
		// System.out.println("usuario " + codigoUsuario);

		RequestDispatcher rd = request.getRequestDispatcher("loja");
		rd.forward(request, response);
	}
	
	
	//_______________________________________________
	protected void produtoSelecionado(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String codigoProduto = request.getParameter("codigoProduto");
		Produto produto = dao.produtoSelecionado(codigoProduto);
		/*
		 * System.out.println(codigoProduto);
		 * System.out.println(produto.getCodProduto());
		 */
		// Enviar os dados do produto prara pagina produto-selecionado.jsp
		request.setAttribute("codProduto", produto.getCodProduto());
		request.setAttribute("nome", produto.getNome());
		request.setAttribute("descricao", produto.getDescricao());
		request.setAttribute("categotia", produto.getCategoria());
		request.setAttribute("imagem", produto.getImagem());
		request.setAttribute("preco", produto.getPreco());
		request.setAttribute("codigo", produto.getCodigo());
		request.setAttribute("quantidade", produto.getQuantidade());

		RequestDispatcher rd = request.getRequestDispatcher("produto-selecionado.jsp");
		rd.forward(request, response);
	}

	protected void verCarrinho(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idUsuario = request.getParameter("idUsuario");

		// Criar objecto para receber os dados dos produto
		ArrayList<Carrinho> carrinho = dao.carrinhoVer(idUsuario);

		// enviar a lista de produtos para listarProduto.jsp
		request.setAttribute("carrinho", carrinho);
		RequestDispatcher rd = request.getRequestDispatcher("carrinho.jsp");
		rd.forward(request, response);

	}

	protected void removerCarrinho(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idTemProduto = request.getParameter("idItemPedido");
		System.out.println("id: " + idTemProduto);
		dao.removerDoCarrinho(idTemProduto);
		response.sendRedirect("loja");
	}

	protected void pesquisa(HttpServletRequest request, HttpServletResponse response, String nomeImagem)
			throws ServletException, IOException {

		String pesquisa = request.getParameter("pesquisa");

		// Criar objecto para receber os dados dos produto
		ArrayList<Produto> listaPesquisa = dao.pesquisa(pesquisa);

		// enviar a lista de produtos para listarProduto.jsp
		request.setAttribute("listaPesquisa", listaPesquisa);
		RequestDispatcher rd = request.getRequestDispatcher("pesquisa.jsp");
		rd.forward(request, response);

		System.out.println(pesquisa);
	}
	
	protected void compra(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String idUsuario = request.getParameter("idUsuario");
		dao.compra(idUsuario);

		response.sendRedirect("index.jsp");
	}
	
	protected void verFavorito(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Criar objecto para receber os dados dos produto
		
		String idUsuario = request.getParameter("idUsuario");
		System.out.println("" + idUsuario);
		
		
		ArrayList<Produto> listaFavoritos = dao.verFavorito(idUsuario);

		request.setAttribute("listaFavoritos", listaFavoritos);
		RequestDispatcher rd = request.getRequestDispatcher("produtoFavorito.jsp");
		rd.forward(request, response);

		// response.sendRedirect("loja.jsp");
	}
	
	protected void novoFavorito(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String codigoProduto = request.getParameter("idProduto");
		String codigoUsuario = request.getParameter("idUsuario");
	
		System.out.println("id P " + codigoProduto);
		System.out.println("id P " + codigoUsuario);
		
		dao.novoFavorito(codigoUsuario, codigoProduto);

		RequestDispatcher rd = request.getRequestDispatcher("loja");
		rd.forward(request, response);
	}


}
