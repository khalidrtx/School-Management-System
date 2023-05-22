package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.personnel.Professeur;
import Domaine.utilisateur.Utilisateur;
import dao.cahierTexte.CahierTexteDAO;
import dao.cahierTexte.InspectionDAO;

/**
 * Servlet implementation class ProfesseurListByMIns
 */
@WebServlet("/ProfesseurListByMIns")
public class ProfesseurListByMIns extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
    public ProfesseurListByMIns() {
        super();
        inspectionDAO= new InspectionDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Professeur> tab= new ArrayList<Professeur>();	
		HttpSession session=request.getSession();
		int userID = (Integer) session.getAttribute("userID");
		
		try {
			System.out.println(userID);
			tab=inspectionDAO.getAllProfByInsp(userID);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
