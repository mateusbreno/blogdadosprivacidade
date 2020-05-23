package br.usjt.devweb.bloglgpd.service;

import java.sql.SQLException;
import java.util.ArrayList;

import br.usjt.devweb.bloglgpd.dao.BlogDAO;
import br.usjt.devweb.bloglgpd.model.Postagem;

public class BlogService {
	BlogDAO dao = new BlogDAO();

	public int criar(Postagem postagem) {
		return dao.criar(postagem);
	}

	public void atualizar(Postagem postagem) {
		dao.atualizar(postagem);
	}

	public void excluir(int id) {
		dao.excluir(id);
	}

	public Postagem carregar(int id) {
		return dao.carregar(id);
	}

	public void atualizarStatus(Postagem postagem) {
		dao.atualizarStatus(postagem);
	}

	public ArrayList<Postagem> getPostagems(int offset) throws SQLException {
		ArrayList<Postagem> lista1 = new ArrayList<>();
		ArrayList<Postagem> lista2 = new ArrayList<>();
		ArrayList<Postagem> lista3 = new ArrayList<>();

		lista1 = dao.getPostsLiberadosPaginado(offset);		
		if (lista1.size() > 0) {
			for (Postagem p : lista1) {
				lista2 = dao.getFilhos(p.getId());
				if (lista2.size() > 0) {
					for (Postagem p2 : lista2) {
						lista3 = dao.getFilhos(p2.getId());
						if (lista3.size() > 0) {
							p2.setPostagens(lista3);
						}
					}
					p.setPostagens(lista2);
				}
			}
		}

		return lista1;
	}
	
	public ArrayList<Postagem> getPostagensAprovacaoModerador() throws SQLException {
		ArrayList<Postagem> lista1 = new ArrayList<>();
		ArrayList<Postagem> lista2 = new ArrayList<>();
		ArrayList<Postagem> lista3 = new ArrayList<>();

		lista1 = dao.getAllPosts();		
		if (lista1.size() > 0) {
			for (Postagem p : lista1) {
				lista2 = dao.getFilhos(p.getId());
				if (lista2.size() > 0) {
					for (Postagem p2 : lista2) {
						lista3 = dao.getFilhos(p2.getId());
						if (lista3.size() > 0) {
							p2.setPostagens(lista3);
						}
					}
					p.setPostagens(lista2);
				}
			}
		}

		return lista1;
	}

	public int totalRegistros() throws SQLException {
		return dao.totalRegistros();
	}
}
