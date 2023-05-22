package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;

import Domaine.cahierTexte.Inspection;
import dao.cahierTexte.InspectionDAO;
import util.ServerResponse;

/**
 * Servlet implementation class InspectionUpdate
 */
@WebServlet("/InspectionUpdate")
public class InspectionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InspectionUpdate() {
        super();
        inspectionDAO= new InspectionDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String message=null;
		int id=Integer.parseInt(request.getParameter("id"));
		String observation=request.getParameter("observation");
		String etat = request.getParameter("etat");
		Inspection ins = new Inspection();
		ins.setId(id);
		ins.setObservation(observation);
		ins.setEtat(etat);
		try {
			
			inspectionDAO.update(ins);
			message="L'Inspection � �t� modifi�e avec succ�s";
			
		} catch (Exception e) {
			
			message="Impossible de modifier l'inspection";
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(message).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

}
