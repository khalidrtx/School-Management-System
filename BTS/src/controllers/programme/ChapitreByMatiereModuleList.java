package controllers.programme;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.programme.Chapitre;
import dao.programme.ChapitreDAO;

/**
 * Servlet implementation class ModuleMatiereByChapitre
 */
@WebServlet("/ChapitreByMatiereModuleList")
public class ChapitreByMatiereModuleList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ChapitreDAO ChapitreDAO;

   
    public ChapitreByMatiereModuleList() {
        super();
    	ChapitreDAO=new ChapitreDAO();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Chapitre> Chapitres= new ArrayList<Chapitre>();
		int moduleId=Integer.parseInt(request.getParameter("selectedModule"));
		int matireId=Integer.parseInt(request.getParameter("selectedMatiere"));
		String json=null;
		
		try {
			Chapitres= ChapitreDAO.getAllChapitreByModuleMatiere(matireId,moduleId);
			json = new Gson().toJson(Chapitres);
						
		} catch (Exception e) {
			json = new Gson().toJson(e.getMessage()).toString();
			e.printStackTrace();	
			}	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}


}
