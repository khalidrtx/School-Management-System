package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import dao.cahierTexte.AcrivitePedagogiqueDAO;
import dao.cahierTexte.CahierTexteDAO;
import dao.emploiDuTemps.SeanceDAO;
import dao.programme.ConceptDAO;
import util.ServerResponse;

/**
 * Servlet implementation class CahierTexteUpdate
 */
@WebServlet("/CahierTexteUpdate")
public class CahierTexteUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CahierTexteUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 
		 int  CahierTexteId = Integer.parseInt(request.getParameter("CahierTexteId"));
		 int  seanceId = Integer.parseInt(request.getParameter("seanceId"));
		 //////
		 int	Activiteid = Integer.parseInt(request.getParameter("Activite"));
		 int	Conceptid = Integer.parseInt(request.getParameter("Concepte"));
		 int	Chapitreid = Integer.parseInt(request.getParameter("Chapitre"));
		 String Contenu = request.getParameter("Contenu").trim();
		 String Observation = request.getParameter("Observation").trim(); 
		 String Etat = request.getParameter("Etat").trim();
		 
		 String Dateseance = request.getParameter("Seance");
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 String message=null;
		 boolean success =false;
		 
	        try {
	        	
	        	java.util.Date 	dateseanceConvereted =  format.parse(Dateseance);
	        	java.sql.Date sqlDate = new java.sql.Date(dateseanceConvereted.getTime());
	        
	        	CahierTexte CahierTexte= new CahierTexte();
	        	Seance Seance= new Seance();
	        	AcrivitePedagogique AcrivitePedagogique= new AcrivitePedagogique();
	        	Concept concepte= new Concept();
	        	Chapitre Chapitre=new Chapitre();

	        	
	        	SeanceDAO SeanceDAO =new SeanceDAO();
	        	CahierTexteDAO CahierTexteDAO = new CahierTexteDAO();
	        	AcrivitePedagogiqueDAO AcrivitePedagogiqueDAO= new AcrivitePedagogiqueDAO();
	        	ConceptDAO ConceptDAO = new ConceptDAO();
	        	AcrivitePedagogique=AcrivitePedagogiqueDAO.getById(Activiteid);

	        	Seance=SeanceDAO.getById(seanceId);
	        	Seance.setDate(sqlDate);
	        	Seance.setEtat(Etat);
	        	Seance.setObservation(Observation);
	        	SeanceDAO.update(Seance);//to do

	        	concepte.setId(Conceptid);
	        	
	        	Chapitre.setId(Chapitreid);
	        	concepte.setChapitre(Chapitre);
	        	
	        	CahierTexte.setId(CahierTexteId);
	        	CahierTexte.setSeance(Seance);
	        	CahierTexte.setTexte(Contenu);
	        	CahierTexte.addActivite(AcrivitePedagogique);
	        	CahierTexte.addConcept(concepte);

	        	CahierTexteDAO.update(CahierTexte);//to do
		        AcrivitePedagogiqueDAO.update(AcrivitePedagogique, CahierTexte);
		        ConceptDAO.update(concepte,CahierTexte);//to do
	        	success=true;
				message="Le cahier de texte a ete modifier avec succes ";
			} catch (Exception e1) {

				success=false;
				message="Impossible de modifier le cahier de texte ";
				e1.printStackTrace();
			}
	        
			ServerResponse serverResponse = new ServerResponse(success,message);
			Gson gson = new GsonBuilder().create();
		    String json = gson.toJson(serverResponse);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
	}
	
}


