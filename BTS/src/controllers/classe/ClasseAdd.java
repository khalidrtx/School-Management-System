package controllers.classe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServerResponse;

import Domaine.classe.AnneeScolaire;
import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.classe.Cycle;
import Domaine.classe.Filiere;
import Domaine.classe.Niveau;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.classe.AnneeScolaireDAO;
import dao.classe.ClasseDAO;
import dao.classe.ClasseGeneriqueDAO;
import dao.classe.CycleDAO;
import dao.classe.FiliereDAO;
import dao.classe.NiveauDAO;


/**
 * Servlet implementation class ClasseController
 */
@WebServlet("/Classe/Add")
public class ClasseAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ClasseDAO classeDAO;  
    public ClasseAdd() {
        super();
        classeDAO = new ClasseDAO();
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cycleId=Integer.parseInt(request.getParameter("cycle"));
		int filiereId=Integer.parseInt(request.getParameter("filiere"));
		int niveauId=Integer.parseInt(request.getParameter("niveau"));
		int anneeScolaireId=Integer.parseInt(request.getParameter("anneescolaire"));
		String label=request.getParameter("label");
		
		
		
		String message=null;
		boolean success =false;
		
		try {
			Cycle cycle = new Cycle();
			Filiere filiere = new Filiere();
			Niveau niveau = new Niveau();
			AnneeScolaire anneeScolaire = new AnneeScolaire();
			ClasseGenerique classeGenerique = new ClasseGenerique();
			
			CycleDAO cycleDA0 = new CycleDAO();
			FiliereDAO filiereDAO = new FiliereDAO();
			NiveauDAO niveauDA0 = new NiveauDAO();
			AnneeScolaireDAO anneeScolaireDAO = new AnneeScolaireDAO();
			ClasseGeneriqueDAO classeGeneriqueDAO = new ClasseGeneriqueDAO();
			
			cycle = cycleDA0.getById(cycleId);
			filiere= filiereDAO.getById(filiereId);
			niveau = niveauDA0.getById(niveauId);
			anneeScolaire = anneeScolaireDAO.getById(anneeScolaireId);
			
			classeGenerique.setCycle(cycle);
			classeGenerique.setFiliere(filiere);
			classeGenerique.setNiveau(niveau);
			classeGenerique.setCode();
			//Si une classe g�n�rique correspondante � la classe que l'on veut cr�er existe.
			ClasseGenerique classeGeneriqueT = classeGeneriqueDAO.exists(classeGenerique);
			if(classeGeneriqueT != null){
			    Classe classe = new Classe();
			    classe.setClasseGenerique(classeGeneriqueT);
			    classe.setAnneeScolaire(anneeScolaire);
			    classe.setLabel(label);
			    classe.setCode();
			    //Si la classe que l'on veut cr�er existe d�j�
			    Classe classeToAdd = classeDAO.exists(classe);
			    if(classeToAdd ==null){
					success=true;
					message="La classe � �l� ajout�e avec succ�s ";
			    }else{
			    	success=false;
					message="Impossible d'ajouter la classe, cette classe existe d�j�";	
			    }
				
			}else{
				success=false;
				message="Impossible de cr�er la classe avant d'avoir cr�er la classe g�n�rique correspondante";
			}
			
			
		} catch (SQLException e1) {
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
