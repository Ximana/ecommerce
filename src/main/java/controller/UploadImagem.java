package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadImagem
 */
@WebServlet(urlPatterns = { "/UploadImagem", "/admin/UploadImagem" })
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1, // 1 mb
		maxFileSize = 1024 * 1024 * 10, // 10 mb
		maxRequestSize = 1024 * 1024 * 100 // 100mb
		
		)
public class UploadImagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Part filepart = request.getPart("imagem");
		String filename = filepart.getSubmittedFileName();
		for (Part part : request.getParts()) {
			//part.write("C:\\" + filename);

			part.write("C:\\Users\\XM\\eclipse-workspace\\ecommerce\\src\\main\\webapp\\assets\\img\\produtos\\" + filename);
		}
		response.getWriter().print("File Uploaded");
		//doGet(request, response);
	}

}
