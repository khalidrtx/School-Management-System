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

import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.programme.Chapitre;
import dao.emploiDuTemps.*;

/**
 * Servlet implementation class ModuleMatiereBySeancegenListe
 */
@WebServlet("/ModuleMatiereBySeancegenListe")
public class ModuleMatiereBySeancegenListe extends HttpServlet {
	private static final long serialVersionUID = 1L;
   private SeanceGeneriqueDAO SeanceGeneriqueDAO;
    public ModuleMatiereBySeancegenListe() {
        super();
        SeanceGeneriqueDAO=new SeanceGeneriqueDAO();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SeanceGenerique> SeanceGenerique= new ArrayList<SeanceGenerique>();
		String json=null;
		int sq=Integer.parseInt(request.getParameter("id"));
		try {
			
			SeanceGenerique= SeanceGeneriqueDAO.getMatiereModulebyseancegen(sq);
			json = new Gson().toJson(SeanceGenerique);
			
		} catch(Exception e){
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




