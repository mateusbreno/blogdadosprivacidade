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

@WebServlet("/Index")
public class ExibirPostagemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// private RepositoryPostagem repositoryPostagem;

//	public ExibirPostagemServlet() {
//		super();
//		repositoryPostagem = (RepositoryPostagem) new BlogDAO();
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// int numeroPagina = Integer.parseInt(request.getParameter("pagina"));
		int offset = 0;
		if (request.getParameter("offset") != null) {
			offset = Integer.parseInt(request.getParameter("offset"));
		}
		BlogService service = new BlogService();

		try {
			ArrayList<Postagem> postsLiberados = service.getPostagems(offset);
			int totalPosts = service.totalRegistros();
			request.setAttribute("postsLiberados", postsLiberados);
			request.setAttribute("totalPosts", totalPosts);
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			throw new ServletException("Não foi possivel obter posts do banco", e);
		}
	}
}
