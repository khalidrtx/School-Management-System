package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.AnneeScolaire;
import Domaine.emploiDuTemps.SeanceGenerique;
import dao.cahierTexte.CahierTexteDAO;

/**
 * Servlet implementation class CahierTexteDelete
 */
@WebServlet("/CahierTexteDelete")
public class CahierTexteDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CahierTexteDAO cahierTexteDAO;

  
    public CahierTexteDelete() {
        super();
        cahierTexteDAO= new CahierTexteDAO();
        }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String message=null;
		boolean result=false;
		int id=Integer.parseInt(request.getParameter("id"));
		try {
				CahierTexte CahierTexte = new CahierTexte();
				CahierTexte.setId(id);
				cahierTexteDAO.delete(CahierTexte);
				message="L'ann�e scolaire � �t� supprim�e avec succ�s";
		} catch (SQLException e) {
			message="Impossible de supprimer l'ann�e scolaire";
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(message).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
