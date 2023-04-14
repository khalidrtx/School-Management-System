package controllers.programme;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.classe.Classe;
import Domaine.programme.Chapitre;
import dao.programme.*;
@WebServlet("/Chapitre/Delete")
public class ChapitreDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private	ChapitreDAO ChapitreDAO;

   
    public ChapitreDelete() {
        super();
        ChapitreDAO=new ChapitreDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id=Integer.parseInt(request.getParameter("id"));
		Chapitre Chapitre = new Chapitre();
		Chapitre.setId(id);
		String message =null;
		try {
			ChapitreDAO.Delete(Chapitre);
			message="chapitre et supprimer avec succes";
			
		} catch (SQLException e) {
			message="Impossible de supprimer la classe";
			e.printStackTrace();
		}	
		String json = new Gson().toJson(message).toString();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}	
	}

	


