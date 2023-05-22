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
import Domaine.cahierTexte.Inspection;
import dao.cahierTexte.InspectionDAO;

/**
 * Servlet implementation class InspectionList
 */
@WebServlet("/InspectionList")
public class InspectionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InspectionList() {
        super();
        inspectionDAO= new InspectionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idProf =Integer.parseInt(request.getParameter("id"));
		int idClass =Integer.parseInt(request.getParameter("idClass"));
		HttpSession session=request.getSession();
		int userID = (Integer) session.getAttribute("userID");
		ArrayList<Inspection> ins= new ArrayList<Inspection>();
		try {
			ins = inspectionDAO.getAllById(userID,idProf,idClass);
			String json = new Gson().toJson(ins).toString();
			//System.out.println(json);
			response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
