package controllers.securite;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Domaine.utilisateur.Utilisateur;

import com.google.gson.Gson;

import dao.utilisateur.UtilisateurDAO;

/**
 * Servlet implementation class Authentification
 */
@WebServlet("/Authentification")
public class Authentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authentification() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message=null;
		Boolean succes=false;
		String login = request.getParameter("login");
		String motPass = request.getParameter("password");
		UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
		Utilisateur utilisateur = new Utilisateur();
		String homePage=null;
		try {
			utilisateur = utilisateurDAO.authentificate(login, motPass);
			if(utilisateur != null){
				 HttpSession session=request.getSession();  
			     session.setAttribute("userID",utilisateur.getId()); 
			     session.setAttribute("userLastName_Fr", utilisateur.getNom_Fr());
			     session.setAttribute("userFirstName_Fr", utilisateur.getPrenom_Fr());
			     session.setAttribute("userLastName_Ar", utilisateur.getNom_Ar());
			     session.setAttribute("userFirstName_Ar", utilisateur.getPrenom_Ar());
			     session.setAttribute("userRole", utilisateur.getComptes().get(0).getRole().getNom_Fr());
			     session.setAttribute("userRoleCode", utilisateur.getComptes().get(0).getRole().getCode());
			     session.setAttribute("userCompte", utilisateur.getComptes().get(0).getId());
			     session.setAttribute("userPhoto", utilisateur.getPhoto());
			     succes=true;
			     
			   // Note pour le projet : Authentification
			     
			   //TODO : 
			    	// Charger les permission du role de l'utilisateur � partir de la base de donn�e
			    	// Configurer Spring secutity pour le role en question
			     	//....
			        
				    if(utilisateur.getComptes().get(0).getRole().getCode().equalsIgnoreCase("PROFESSEUR")){
				    	homePage="/WEB-INF/E.Professeur/index.jsp";
				    }else if(utilisateur.getComptes().get(0).getRole().getCode().equalsIgnoreCase("ETUDIANT")){
				    	homePage="/WEB-INF/E.Etudiant/index.jsp";
				    } else if(utilisateur.getComptes().get(0).getRole().getCode().equalsIgnoreCase("SCOLARITE")) {
				    	homePage="/WEB-INF/E.Scolarite/index.jsp";
				    }else if(utilisateur.getComptes().get(0).getRole().getCode().equalsIgnoreCase("DIRECTEUR-ETUDES")) {
				    	homePage="/WEB-INF/E.DirecteurEtudes/index.jsp";
				    }else if(utilisateur.getComptes().get(0).getRole().getCode().equalsIgnoreCase("INSPECTEUR")){
				    	homePage="/WEB-INF/E.Inspecteur/index.jsp";
				    
				    	/*
				    	 * .....
				    	 * ....
				    	 * Idem pour les autres profiles (Acteurs)
				    	 */
				    	
				    }else{
				    	homePage="/WEB-INF/index.jsp";
				    }
			    
			}else{
			    	succes=false;
			    	message="login ou mot de passe incorrect";
			 }
			
		} catch (SQLException e) {
			succes=false;
			message=e.getMessage().toString()+e.getCause().toString();
			e.printStackTrace();
		}
		if(succes){
			
			//Redirig� vers page appropri�
			RequestDispatcher view = request.getRequestDispatcher(homePage);
			view.forward(request, response);
		}else{
			String json = new Gson().toJson(message).toString();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		}
		
	}

}
