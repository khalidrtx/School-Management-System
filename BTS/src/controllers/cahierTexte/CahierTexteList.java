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

import com.google.gson.Gson;

import Domaine.cahierTexte.CahierTexte;
import dao.cahierTexte.CahierTexteDAO;

/**
 * Servlet implementation class CahierTexteList
 */
@WebServlet("/CahierTexteList")
public class CahierTexteList extends HttpServlet {
	private CahierTexteDAO cahierTexteDAO;
	private static final long serialVersionUID = 1L;
       
    public CahierTexteList() {
        super();
        cahierTexteDAO= new CahierTexteDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int idclass = Integer.parseInt(request.getParameter("id"));
		int userID= Integer.parseInt(request.getParameter("profId"));
		ArrayList<CahierTexte> cahierTextes = new ArrayList<CahierTexte>();
		
		try {
			cahierTextes = cahierTexteDAO.getCahiertexteByProfClass(userID, idclass);
			String json = new Gson().toJson(cahierTextes);
			response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}