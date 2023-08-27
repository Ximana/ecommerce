package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
        
    }
/*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String senha = request.getParameter("senha");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ecommerce?useTimezone=true&serverTimezone=UTC", "root", "root");
			PreparedStatement pst = con.
					prepareStatement("select *  from usuario where Email = ? and Senha = ? ");
			pst.setString(1, email);
			pst.setString(2, senha);

			ResultSet rs = pst.executeQuery();
					if (rs.next()) {
						session.setAttribute("codigo", rs.getString("CodUsuario"));
						session.setAttribute("Nome", rs.getString("Nome"));
						dispatcher = request.getRequestDispatcher("index.jsp");
					} else {
						request.setAttribute("status", "failed");
						dispatcher = request.getRequestDispatcher("login.html");
					}
			
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
