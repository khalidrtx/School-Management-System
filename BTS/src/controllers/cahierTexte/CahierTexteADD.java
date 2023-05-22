package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import dao.cahierTexte.*;
import dao.emploiDuTemps.*;
import dao.programme.ConceptDAO;
import util.ServerResponse;

@WebServlet("/CahierTexteADD")
public class CahierTexteADD extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CahierTexteADD() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 int  Seancegenid = Integer.parseInt(request.getParameter("seanceGenerique"));
		 int	Activiteid = Integer.parseInt(request.getParameter("Activite"));
	  // String[] concepts = request.getParameterValues("concepts"); // récupérer toutes les valeurs sélectionnées
		 int	Conceptid = Integer.parseInt(request.getParameter("Concepte"));
		 int	Chapitreid = Integer.parseInt(request.getParameter("Chapitre"));
		 String Contenu = request.getParameter("Contenu").trim();
		 String Observation = request.getParameter("Observation").trim(); 
		 String Etat = request.getParameter("Etat").trim();
		 String seance = request.getParameter("Seance");
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 String message=null;
		 boolean success =false;
		 	CahierTexte CahierTexte= new CahierTexte();
		 	Seance Seance= new Seance();
		 	SeanceDAO SeanceDAO =new SeanceDAO();
		 	SeanceGenerique SeanceGenerique= new SeanceGenerique();
		 	CahierTexteDAO CahierTexteDAO = new CahierTexteDAO();
		 	AcrivitePedagogique AcrivitePedagogique= new AcrivitePedagogique();
		 	AcrivitePedagogiqueDAO AcrivitePedagogiqueDAO= new AcrivitePedagogiqueDAO();
		 	ConceptDAO ConceptDAO = new ConceptDAO();
		 	Concept concepte= new Concept();
		 	Chapitre Chapitre=new Chapitre();
	        try {
	        	
	        	java.util.Date 	dateseance =  format.parse(seance);
	        	java.sql.Date sqlDate = new java.sql.Date(dateseance.getTime());
	        	
	        	SeanceGenerique.setId(Seancegenid);
	        	AcrivitePedagogique=AcrivitePedagogiqueDAO.getById(Activiteid);
	        	
	        	Seance.setDate(sqlDate);
	        	Seance.setSeanceGenerique(SeanceGenerique);
	        	
	        	SeanceDAO.insert(Seance);
	        	
	        	concepte.setId(Conceptid);
	        	
	        	Chapitre.setId(Chapitreid);
	        	concepte.setChapitre(Chapitre);
	        	CahierTexte.setSeance(Seance);
	        	CahierTexte.setTexte(Contenu);
	        	CahierTexte.addActivite(AcrivitePedagogique);
	        	CahierTexte.addConcept(concepte);
	        	CahierTexte.setEtat(Etat);
	        	CahierTexte.setObservation(Observation);

	        	CahierTexteDAO.insert(CahierTexte);
		        AcrivitePedagogiqueDAO.insert(AcrivitePedagogique, CahierTexte);
		        ConceptDAO.insert(concepte,CahierTexte);
	        	success=true;
				message="Le cahier de texte est ajouter avec succes ";
			} catch (Exception e1) {
				success=false;
				message="Impossible d'ajouter l'enregistrement ";
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
