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

@WebServlet("/PostagemServlet")
public class PostagemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// try {
		request.setCharacterEncoding("UTF-8");
		Postagem postagem = new Postagem();
		// Data data = new Data();
		postagem.setAutor(request.getParameter("AUTOR_POSTAGEM"));
		postagem.setTitulo(request.getParameter("TITULO_POSTAGEM"));
		postagem.setTexto(request.getParameter("MENSAGEM_POSTAGEM"));
		String ref = request.getParameter("REFERENCIA");		
		if (ref.length() > 0) {
			postagem.setReferencia(Integer.parseInt(ref));
		}
//		try {
//			postagem.setData(request.getParameter("DATA_POSTAGEM"));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		// } catch (Exception e) {
		// e.getMessage();
		// }
		// SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm");
		// Date DATA_POSTAGEM = sdf.parse(pData);

		// instanciar o javabean
		/*
		 * Postagem postagem = new Postagem(); postagem.setAutor(pAutor);
		 * postagem.setTitulo(pTitulo); postagem.setTexto(pTexto);
		 * postagem.setData(pData);
		 */

		/*
		 * Postagem postagem = new Postagem(); postagem.setAutor(pAutor);
		 * postagem.setTitulo(pTitulo); postagem.setTexto(pTexto);
		 * postagem.setData(pData);
		 */

		// instanciar o service
		// Postagem postagem = new Postagem();
		BlogService bs = new BlogService();
		bs.criar(postagem);
		postagem = bs.carregar(postagem.getId());

		// enviar para JSP
		request.setAttribute("postagem", postagem);
		RequestDispatcher view = request.getRequestDispatcher("testeExibePostagem.jsp");
		view.forward(request, response);
	}
}