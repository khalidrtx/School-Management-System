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
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;

import Domaine.classe.Classe;
import Domaine.classe.Cycle;
import Domaine.emploiDuTemps.SeanceGenerique;
import dao.emploiDuTemps.SeanceGeneriqueDAO;
@WebServlet("/TableauService/List")
public class TableauService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SeanceGeneriqueDAO emploi;
    public TableauService() {
        super();
        emploi = new SeanceGeneriqueDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session =request.getSession();
    	int userID=(Integer)session.getAttribute("userID");
    	
		ArrayList<SeanceGenerique> emplois;
	    String json;
		try {
			emplois = emploi.getEmploiByProf(userID);
			json = new Gson().toJson(emplois);
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