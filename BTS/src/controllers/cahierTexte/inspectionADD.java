package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Domaine.cahierTexte.CahierTexte;
import Domaine.cahierTexte.Inspection;
import Domaine.classe.AnneeScolaire;
import Domaine.personnel.Inspecteur;
import dao.cahierTexte.InspectionDAO;

/**
 * Servlet implementation class inspectionADD
 */
@WebServlet("/inspectionADD")
public class inspectionADD extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inspectionADD() {
        super();
        inspectionDAO= new InspectionDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String observation=request.getParameter("observation");
			String etat = request.getParameter("etat");
			int id=Integer.parseInt(request.getParameter("id"));
			HttpSession session=request.getSession();
			int userID = (Integer) session.getAttribute("userID");
			String message=null;
			boolean result=false;
			Inspection ins = new Inspection();
			ins.setObservation(observation);
			ins.setEtat(etat);
		try {
			
			Inspecteur inspecteur = new Inspecteur();
			inspecteur.setId(userID);
			ins.setInspecteur(inspecteur);
			CahierTexte c = new CahierTexte();
			c.setId(id);
			ins.setCahierTexte(c);
			inspectionDAO.insert(ins);
			message="L'ann�e scolaire � �t� ajout�e avec succ�s";
			result=true;
		} catch (Exception e) {
			
			result=false;
			message="Impossible d'affecter le projet";
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
