package br.usjt.devweb.bloglgpd;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.usjt.devweb.bloglgpd.model.Postagem;
import br.usjt.devweb.bloglgpd.service.BlogService;

@WebServlet("/ExibirDetalhePostagem")
public class ExibirDetalhePostagemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("ID_POSTAGEM"));		

		// instanciar o service
		BlogService bs = new BlogService();
		Postagem postagem = bs.carregar(id);	

		// enviar para JSP
		request.setAttribute("post", postagem);
		RequestDispatcher view = request.getRequestDispatcher("detalhePostagem.jsp");
		view.forward(request, response);
	}

}
