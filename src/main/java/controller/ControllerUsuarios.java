package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;


//@WebServlet(urlPatterns = {"/ControllerUsuarios", "/admin/usuario"})
public class ControllerUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO dao = new DAO();
     
    public ControllerUsuarios() {
        super();

    }

	

}
