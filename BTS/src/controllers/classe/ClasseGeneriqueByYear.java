package controllers.classe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.classe.AnneeScolaire;
import Domaine.classe.ClasseGenerique;
import dao.classe.AnneeScolaireDAO;
import dao.classe.ClasseGeneriqueDAO;

@WebServlet("/ClasseGeneriqueByYear")
public class ClasseGeneriqueByYear extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AnneeScolaireDAO anneeScolaireDAO;  
	private ClasseGeneriqueDAO classeGeneriqueDAO;
    public ClasseGeneriqueByYear() {
    	
        super();
        classeGeneriqueDAO = new ClasseGeneriqueDAO();
        anneeScolaireDAO= new AnneeScolaireDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ClasseGenerique> classeGeneriques= new ArrayList<ClasseGenerique>();
		HttpSession session=request.getSession();  
		int userID = (Integer) session.getAttribute("userID");
//		try {
//		int id=Integer.parseInt(request.getParameter("AnneeScolaireId")) ;
//			int id=Integer.parseInt(request.getParameter("id"));
//			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
//	        Date dateDebut =  (Date) format.parse(request.getParameter("dateDebut"));
//	        Date dateFin =  (Date) format.parse(request.getParameter("dateFin"));
//			AnneeScolaire anneeScolaire = anneeScolaireDAO.getById(id);		
//			Date dateDebut=(Date) anneeScolaire.getDateDebut();
//			Date dateFin=(Date) anneeScolaire.getDateFin();
//			classeGeneriques = classeGeneriqueDAO.getAllclassbyprof(userID);
//			
//			//needs more explaining..
//			Gson gson = new GsonBuilder().create();
//			String json = gson.toJson(classeGeneriques).toString();
//			response.setContentType("application/json");
//			response.setCharacterEncoding("UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print(json);
//			out.flush();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} 	
	}

}
