package controllers.programme;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.programme.Concept;
import dao.programme.*;
@WebServlet("/ConcepteByChapitreList")
public class ConcepteByChapitreList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConceptDAO ConceptDAO;
   
    public ConcepteByChapitreList() {
        super();
        ConceptDAO=new ConceptDAO();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Concept> Concepts= new ArrayList<Concept>();
		int chapitreId=Integer.parseInt(request.getParameter("chapitreId"));
		String json=null;
		
		try {
			Concepts= ConceptDAO.getAllConceptByChapitre(chapitreId);
			json = new Gson().toJson(Concepts);
			
		} catch (Exception e) {
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



