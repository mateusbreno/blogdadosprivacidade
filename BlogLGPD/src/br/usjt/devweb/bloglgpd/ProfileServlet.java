package br.usjt.devweb.bloglgpd;

import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
public class ProfileServlet extends HttpServlet {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                      throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        request.getRequestDispatcher("cadastro.jsp").include(request, response);  
          
        HttpSession session=request.getSession(false);  
        if(session!=null && session.getAttribute("name")!=null){  
        String name=(String)session.getAttribute("name");  
          
        out.print("Olá, "+name+" Bem vindo a tela de perfil");  
        }  
        else{  
            out.print("Por favor logue primeiro!");  
            request.getRequestDispatcher("login.jsp").include(request, response);  
        }  
        out.close();  
    }  
}  