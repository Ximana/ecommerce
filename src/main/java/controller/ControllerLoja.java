package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;

@WebServlet(urlPatterns = { "/ControllerLoja", "/paginaPrincipal", })

public class ControllerLoja extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public ControllerLoja() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.println(action);
		// verificar as requisicoes
				if (action.equals("/paginaPrincipal")) {
					index(request, response);
				} 
	}

	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}
	

}
