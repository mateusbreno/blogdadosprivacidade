package br.usjt.devweb.bloglgpd;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.usjt.devweb.bloglgpd.dao.BlogDAO;
import br.usjt.devweb.bloglgpd.model.Postagem;
import br.usjt.devweb.bloglgpd.service.BlogService;

@WebServlet("/AprovacaoPostagem")
public class DetalhePostagemServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//BlogDAO dao = new BlogDAO();
		BlogService service = new BlogService();
		
		try {			
			//ArrayList<Postagem> allPosts = dao.getAllPosts();
			ArrayList<Postagem> allPosts = service.getPostagensAprovacaoModerador();
			request.setAttribute("allPosts", allPosts);
			RequestDispatcher view = request.getRequestDispatcher("moderacaoPostagem.jsp");
			view.forward(request, response);
		}catch (Exception e) {
			throw new ServletException("Não foi possivel obter posts do banco", e);
		}
	}

}
