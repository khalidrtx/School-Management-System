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
import com.google.gson.GsonBuilder;

import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.AnneeScolaire;
import dao.cahierTexte.CahierTexteDAO;

/**
 * Servlet implementation class CahierTexteDetails
 */
@WebServlet("/CahierTexteDetails")
public class CahierTexteDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CahierTexteDAO cahiertexteDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CahierTexteDetails() {
        super();
        cahiertexteDAO=new CahierTexteDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json=null;
		int id =Integer.parseInt(request.getParameter("id"));
		CahierTexte cahiertexte= new CahierTexte();
		try {

			cahiertexte = cahiertexteDAO.getCahiertexteById(id);
			Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
			json = gson.toJson(cahiertexte);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		} catch (Exception e) {
			json = new Gson().toJson(e.getMessage());
			e.printStackTrace();
		}
	}

}
