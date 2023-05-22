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
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import dao.cahierTexte.CahierTexteDAO;
import dao.emploiDuTemps.SeanceDAO;

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
		Seance Seance=new  Seance();
		SeanceDAO SeanceDAO= new SeanceDAO();
		try {
//				CahierTexte CahierTexte = new CahierTexte();
				Seance.setId(id);
				SeanceDAO.delete(Seance);
//				CahierTexte.setId(id);
//				cahierTexteDAO.delete(CahierTexte);
				message="La seance a ete supprimer avec succees";
		} catch (SQLException e) {
			message="Impossible de supprimer la seance";
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
