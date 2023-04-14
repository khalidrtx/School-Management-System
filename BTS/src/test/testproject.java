package test;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.AnneeScolaire;
import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.evaluation.Soutenance;
import Domaine.personnel.Professeur;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import Domaine.utilisateur.Utilisateur;
import dao.cahierTexte.CahierTexteDAO;
import dao.classe.AnneeScolaireDAO;
import dao.classe.ClasseDAO;
import dao.classe.ClasseGeneriqueDAO;
import dao.emploiDuTemps.SeanceDAO;
import dao.emploiDuTemps.SeanceGeneriqueDAO;
import dao.programme.ChapitreDAO;
import dao.programme.ConceptDAO;

public class testproject {

	
	
	
	public static void main(String[] args) throws SQLException {
		
//		AnneeScolaireDAO anneeScolaireDAO= new AnneeScolaireDAO();
//		AnneeScolaire anneeScolaire = anneeScolaireDAO.getById(3);	
//		System.out.println(anneeScolaire);
//			Date dateDebut=(Date) anneeScolaire.getDateDebut();
//		Date dateFin=(Date) anneeScolaire.getDateFin();
//		ArrayList<Classe> Classes= new ArrayList<Classe>();
//		ClasseDAO ClasseDAO = new ClasseDAO();
//		Classes = ClasseDAO.getAllclassbyprof(10);
//
//		for(Classe a:Classes) {
//			System.out.println(a);
//		}
		
		// test
//	CahierTexteDAO cahierTexteDAO = new CahierTexteDAO();
//	ArrayList<Utilisateur> tab=cahierTexteDAO.getAllprof();
//
//		for(Utilisateur a:tab) {
//			System.out.println(a);
//	}
	
//		ClasseGeneriqueDAO ClasseGeneriqueDAO= new ClasseGeneriqueDAO();
//		ArrayList<ClasseGenerique> c =ClasseGeneriqueDAO.getAll();
//		
//
//		for(ClasseGenerique a :c) {
//			System.out.println(a);
//		}
////		
//		ConceptDAO ConceptDAO= new ConceptDAO();
//		ArrayList<Concept> tab = ConceptDAO.getAllConceptByChapitre(27);
//				for(Concept a :tab) {
//					System.out.println(a);
//				}

		SeanceDAO sdao= new SeanceDAO();
		Seance s= sdao.getById(115);
		System.out.println(s);
	}

	
	}
