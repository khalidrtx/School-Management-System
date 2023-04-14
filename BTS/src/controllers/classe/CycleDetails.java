package controllers.classe;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.classe.Cycle;

import dao.classe.CycleDAO;

/**
 * Servlet implementation class CycleList
 */
@WebServlet("/Cycle/Details")
public class CycleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CycleDAO cycleDAO;
    public CycleDetails() {
        super();
        cycleDAO = new CycleDAO();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt(request.getParameter("id"));
		Cycle cycle= new Cycle();
		cycle.setId(id);
		try {
			cycle = cycleDAO.getById(id);
			String json = new Gson().toJson(cycle);
			
			response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
