package controllers.emplois;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import Domaine.classe.Classe;
import Domaine.classe.Cycle;
import Domaine.emploiDuTemps.SeanceGenerique;
import dao.emploiDuTemps.SeanceGeneriqueDAO;
@WebServlet("/Emploi/List")
public class EmploiList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SeanceGeneriqueDAO emploi;
    public EmploiList() {
        super();
        emploi = new SeanceGeneriqueDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
		ArrayList<SeanceGenerique> emplois= new ArrayList();
	
	
		String json=null;
		try {
			emplois = emploi.getAll(id);
			json = new ObjectMapper().writeValueAsString(emplois);
			System.out.println(json);
			
		} catch (SQLException e) {
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