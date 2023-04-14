package controllers.cahierTexte;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.AnneeScolaire;
import Domaine.personnel.Professeur;
import Domaine.utilisateur.Utilisateur;
import dao.cahierTexte.CahierTexteDAO;

@WebServlet("/ProfesseurList")
public class ProfesseurList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CahierTexteDAO cahierTexteDAO;
    public ProfesseurList() {
        super();
        cahierTexteDAO= new CahierTexteDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Utilisateur> tab= new ArrayList<Utilisateur>();	
		
		try {
			
			tab = cahierTexteDAO.getAllprof();
			Gson gson = new GsonBuilder().create();
			String	json = gson.toJson(tab).toString();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		
			
		} catch (Exception e) {
			e.printStackTrace();	
			}	
	}

}
