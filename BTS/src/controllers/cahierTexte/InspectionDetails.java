package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Domaine.cahierTexte.CahierTexte;
import Domaine.cahierTexte.Inspection;
import dao.cahierTexte.InspectionDAO;

/**
 * Servlet implementation class InspectionDetails
 */
@WebServlet("/InspectionDetails")
public class InspectionDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InspectionDAO inspectionDAO;
       
    public InspectionDetails() {
        super();
        inspectionDAO=new InspectionDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json=null;
		int id =Integer.parseInt(request.getParameter("id"));
		Inspection inspection= new Inspection();
		try {
			
			inspection = inspectionDAO.getById(id);
			Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
			json = gson.toJson(inspection);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
