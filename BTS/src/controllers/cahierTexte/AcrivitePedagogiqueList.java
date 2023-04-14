package controllers.cahierTexte;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Domaine.cahierTexte.*;
import dao.cahierTexte.*;

@WebServlet("/AcrivitePedagogiqueList")
public class AcrivitePedagogiqueList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AcrivitePedagogiqueDAO AcrivitePedagogiqueDAO;
	private AcrivitePedagogique AcrivitePedagogique;
       
   
    public AcrivitePedagogiqueList() {
        super();
        AcrivitePedagogiqueDAO= new AcrivitePedagogiqueDAO();
        AcrivitePedagogique=new AcrivitePedagogique();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<AcrivitePedagogique> tab= new ArrayList<AcrivitePedagogique>();
		String json=null;
		try {
			
			tab = AcrivitePedagogiqueDAO.getAll();
			json = new Gson().toJson(tab);
			
			
		} catch (Exception e) {
			json = new Gson().toJson(e.getMessage());
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

	

	
	
}
