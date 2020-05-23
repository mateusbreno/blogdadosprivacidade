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

@WebServlet("/AlterarStatus")
public class AlterarStatusPostagem extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("ID_POSTAGEM"));
		boolean exibir = Boolean.parseBoolean(request.getParameter("EXIBIR"));

		Postagem postagem = new Postagem();
		postagem.setId(id);
		postagem.setExibir(exibir);

		// instanciar o service
		BlogService bs = new BlogService();
		bs.atualizarStatus(postagem);

		// enviar para JSP
		request.setAttribute("alterar", postagem);
		RequestDispatcher view = request.getRequestDispatcher("/AprovacaoPostagem");
		view.forward(request, response);
	}

}
