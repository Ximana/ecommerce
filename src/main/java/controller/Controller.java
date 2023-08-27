
package controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.DAO;
import model.Cliente;

@WebServlet(urlPatterns = { "/Controller", "/criarUsuario", "/admin/usuario", "/admin/clientesFavoritos" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
	Cliente usuario = new Cliente();

	public Controller() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.println(action);

		// verificar as requisicoes
		if (action.equals("/loja")) {
			produtos(request, response);
		} 
		else if (action.equals("/criarUsuario")) {
			novoCliente(request, response);
		} 
		else if (action.equals("/admin/usuario")) {
			listarClientes(request, response);
		}
		else if (action.equals("/admin/clientesFavoritos")) {
			listarClientes(request, response);
		}
		else {
			response.sendRedirect("index.jsp");
		}
	}

	// Listar Produtos
	protected void produtos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("loja.jsp");
	}

	// Criar Usuario
	protected void novoCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * //Testar dados recebidos System.out.println(request.getParameter("nome"));
		 * System.out.println(request.getParameter("apelido"));
		 * System.out.println(request.getParameter("pais"));
		 * System.out.println(request.getParameter("endereco"));
		 * System.out.println(request.getParameter("cidade"));
		 * System.out.println(request.getParameter("genero"));
		 * System.out.println(request.getParameter("telefone"));
		 * System.out.println(request.getParameter("email"));
		 * System.out.println(request.getParameter("senha"));
		 */

		// o objecto contato recebe os parametros passados
		usuario.setNome(request.getParameter("nome"));
		usuario.setApelido(request.getParameter("apelido"));
		usuario.setPais(request.getParameter("pais"));
		usuario.setEndereco(request.getParameter("endereco"));
		usuario.setCidade(request.getParameter("cidade"));
		usuario.setGenero(request.getParameter("genero"));
		usuario.setNumTelefone(request.getParameter("telefone"));
		usuario.setEmail(request.getParameter("email"));
		usuario.setSenha(request.getParameter("senha"));

		// Inserir na BD com o objecto DAO
		dao.novoCliente(usuario);
		// redirecionar para o documento "index.jsp"
		response.sendRedirect("index.jsp");
	}

	// Listar Usuarios
	protected void listarClientes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//Criar objecto para receber os dados dos clientes
		ArrayList<Cliente> listaClientes = dao.listarClientes();
		
		//enviar a lista de clientes para usuario.jsp
		request.setAttribute("listaClientes", listaClientes);
		RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
		rd.forward(request, response);
		
		
	}
	
	// Login
		protected void login(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			/*
			usuario.setNome(request.getParameter("email"));
			usuario.setEmail(request.getParameter("senha"));
			HttpSession session = request.getSession();
			*/
			response.sendRedirect("index.jsp");
		}

}
