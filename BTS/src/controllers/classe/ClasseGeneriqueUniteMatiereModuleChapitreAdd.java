package controllers.classe;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.matiere.Matiere;
import Domaine.matiere.Module;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import dao.matiere.MatiereDAO;
import dao.matiere.ModuleDAO;
import dao.programme.ChapitreDAO;
import util.ServerResponse;

/**
 * Servlet implementation class ClasseGeneriqueUniteMatiereModuleChapitreAdd
 */
@WebServlet("/ClasseGeneriqueUniteMatiereModuleChapitreAdd")
public class ClasseGeneriqueUniteMatiereModuleChapitreAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private	ChapitreDAO ChapitreDAO;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClasseGeneriqueUniteMatiereModuleChapitreAdd() {
        super();
        ChapitreDAO=new ChapitreDAO();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int configurationMatiereId = Integer.parseInt(request.getParameter("configurationMatiereId"));
		int configurationModuleId = Integer.parseInt(request.getParameter("configurationModuleId"));

		String Chapitrename=request.getParameter("chapitre");
		int MatiereID=Integer.parseInt(request.getParameter("Matiere"));
		int ModuleId=Integer.parseInt(request.getParameter("Module"));
		String Discription=request.getParameter("descri");
				
		String message=null;
		boolean success =false;
		
		try {
			Matiere Matiere = new Matiere();
			Module Module = new Module();
			Concept Concept=new Concept();
			Chapitre Chapitre=new Chapitre();
			
			MatiereDAO MatiereDAO = new MatiereDAO();
			ModuleDAO ModuleDAO = new ModuleDAO();
//			ChapitreDAO ChapitreDAO =new ChapitreDAO();
			
			Matiere = MatiereDAO.getById(MatiereID);
			Module= ModuleDAO.getById(ModuleId);
			
			
			
			Chapitre.setNom(Chapitrename);	
			Chapitre.setDescription(Discription);
			Chapitre.setMatiere(Matiere);
			Chapitre.setModule(Module);
			Concept.setChapitre(Chapitre);


//			int t=Chapitre.getId();
			 message="new record is inserted";
			 success =true;
			ChapitreDAO.insert(Chapitre);
				
			} catch (Exception e) {
				 message="echec d'insertion";
				 success =false;
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


