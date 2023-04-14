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

import Domaine.cahierTexte.Inspection;
import Domaine.classe.AnneeScolaire;
import dao.cahierTexte.InspectionDAO;

/**
 * Servlet implementation class inspectionDelete
 */
@WebServlet("/inspectionDelete")
public class inspectionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inspectionDelete() {
        super();
        inspectionDAO= new InspectionDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String message=null;
		boolean result=false;
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			Inspection inspection  = new Inspection();
			inspection.setId(id);
			inspectionDAO.delete(inspection);
			message="L'inspection � �t� supprim�e avec succ�s";
		} catch (Exception e) {
			message="Impossible de supprimer l'Inspection";
			e.printStackTrace();
		}
		String json = new Gson().toJson(message).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
