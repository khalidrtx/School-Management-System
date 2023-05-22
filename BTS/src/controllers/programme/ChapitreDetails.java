package controllers.programme;
import dao.programme.*;
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

import Domaine.classe.AnneeScolaire;
import Domaine.classe.Niveau;
import Domaine.programme.Chapitre;

/**
 * Servlet implementation class ChapitreDetails
 */
@WebServlet("/ChapitreDetails")
public class ChapitreDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChapitreDAO ChapitreDAO;
    public ChapitreDetails() {
        super();
        ChapitreDAO = new ChapitreDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json=null;
		int id =Integer.parseInt(request.getParameter("id"));
		Chapitre Chapitre= new Chapitre();
		try {
			
			Chapitre = ChapitreDAO.getById(id);
			Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
			json = gson.toJson(Chapitre);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		} catch (SQLException e) {
			json = new Gson().toJson(e.getMessage());
			e.printStackTrace();
		}
		
	}
}




