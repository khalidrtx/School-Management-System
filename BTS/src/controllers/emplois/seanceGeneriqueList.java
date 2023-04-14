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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.emploiDuTemps.*;
import Domaine.emploiDuTemps.SeanceGenerique;


/**
 * Servlet implementation class seanceGeneriqueList
 */
@WebServlet("/seanceGeneriqueList")
public class seanceGeneriqueList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SeanceGeneriqueDAO seancegeneriqueDAO;
    public seanceGeneriqueList() {
        super();
        seancegeneriqueDAO= new SeanceGeneriqueDAO();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<SeanceGenerique> seanceGenerique= new ArrayList<SeanceGenerique>();
		try {
		    HttpSession session=request.getSession();
		    int ClassID =  Integer.parseInt(request.getParameter("id"));
		    int userID= (Integer)session.getAttribute("userID");
		    
		    seanceGenerique = seancegeneriqueDAO.getSeanceGeneriqurByProfnClass(ClassID,userID);
			Gson gson = new GsonBuilder().create();
			String json = gson.toJson(seanceGenerique).toString();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}



}
