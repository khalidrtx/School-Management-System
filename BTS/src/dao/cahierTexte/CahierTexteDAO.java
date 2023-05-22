package dao.cahierTexte;
import dao.programme.ConceptDAO;
import java.sql.*;
import java.util.*;

import com.mysql.jdbc.PreparedStatement;

import Domaine.cahierTexte.*;
import Domaine.classe.AnneeScolaire;
import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.classe.Cycle;
import Domaine.classe.Filiere;
import Domaine.classe.Niveau;
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.locaux.Bloc;
import Domaine.locaux.Salle;
import Domaine.locaux.TypeSalle;
import Domaine.matiere.*;
import Domaine.matiere.Module;
import Domaine.personnel.Professeur;
import Domaine.personnel.Specialite;
import Domaine.programme.Chapitre;
import Domaine.programme.Concept;
import Domaine.utilisateur.Utilisateur;
import dao.database.Db;

public class CahierTexteDAO  {	
	private Connection con;
	private ConceptDAO ConceptDAO;
	public CahierTexteDAO() {
		this.con = Db.getInstance().con;
	}
	
	public void insert(CahierTexte cahierTexte) throws SQLException {
		String sql="insert into cahiertexte (Id,SeanceID,Texte,Observation,Etat) values(null,?,?,?,?)";
		PreparedStatement st = (PreparedStatement) con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		st.setInt(1, cahierTexte.getSeance().getId());
		st.setString(2, cahierTexte.getTexte());
		st.setString(3, cahierTexte.getObservation());
		st.setString(4, cahierTexte.getEtat());
		st.execute();
		ResultSet rsid= st.getGeneratedKeys();
		rsid.next();
		int ids = rsid.getInt(1);
		cahierTexte.setId(ids);
	}
	public void delete(CahierTexte cahierTexte) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("delete from cahiertexte where ID = ?");
			statement.setInt(1, cahierTexte.getId());
			statement.execute();
			statement.close();
		}
	public void update(CahierTexte cahierTexte) throws SQLException {
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update cahiertexte set Texte = ?, Observation=?, Etat=? where ID = ?");
		statement.setString(1, cahierTexte.getTexte());
		statement.setString(2, cahierTexte.getObservation());
		statement.setString(3, cahierTexte.getEtat());
		statement.setInt(4, cahierTexte.getId());
		statement.executeUpdate();
	}
	
	public ArrayList<CahierTexte> getCahiertexteByProfClass(int idProf, int idclass) throws SQLException{
			String sql="SELECT\r\n"
					+ "    cahiertexte.ID AS cahiertexteID,\r\n"
					+ "    cahiertexte.Texte AS cahiertexteTexte,\r\n"
					+ "    cahiertexte.Observation AS cahiertexteObservation,\r\n"
					+ "    cahiertexte.Etat AS cahiertexteEtat,\r\n"
					+ "    acrivitepedagogique.ID AS activiteID,\r\n"
					+ "    acrivitepedagogique.Code AS activiteCode,\r\n"
					+ "    acrivitepedagogique.Nom_Fr AS activiteNomFr,\r\n"
					+ "    acrivitepedagogique.Nom_Ar AS activiteNomAr,\r\n"
					+ "    seance.ID AS seanceID,\r\n"
					+ "    seance.SeanceGeneriqueID AS seanceSeanceGeneriqueID,\r\n"
					+ "    seance.Date AS seanceDate,\r\n"
					+ "    seance.Etat AS seanceEtat,\r\n"
					+ "    seance.Observation AS seanceObservation,\r\n"
					+ "    SeanceGenerique.ClasseID AS SeanceGeneriqueClasseID,\r\n"
					+ "    classe.ClasseGeneriqueID AS classeClasseGeneriqueID,\r\n"
					+ "    classegenerique.NiveauID AS classegeneriqueNiveauID,\r\n"
					+ "    niveau.Code AS niveauCode,\r\n"
					+ "    niveau.Nom_Fr AS niveauNom_Fr,\r\n"
					+ "    niveau.Nom_Ar AS niveauNom_Ar,\r\n"
					+ "    classegenerique.FiliereID AS classegeneriqueFiliereID,\r\n"
					+ "    filiere.Code AS filiereCode,\r\n"
					+ "    filiere.Nom_Fr AS filiereNom_Fr,\r\n"
					+ "    filiere.Nom_Ar AS filiereNom_Ar,\r\n"
					+ "    classegenerique.CycleID AS classegeneriqueCycleID,\r\n"
					+ "    cycle.Code AS cycleCode,\r\n"
					+ "    cycle.Nom_Fr cycleNom_Fr,\r\n"
					+ "    cycle.Nom_Ar AS cycleNom_Ar,\r\n"
					+ "    classegenerique.Description AS classegeneriqueDescription,\r\n"
					+ "    classe.AnneeScolaireID AS classeAnneeScolaireID,\r\n"
					+ "    anneescolaire.Code AS anneescolaireCode,\r\n"
					+ "    anneescolaire.DateDebut AS anneescolaireDateDebut,\r\n"
					+ "    anneescolaire.DateFin AS anneescolaireDateFin,\r\n"
					+ "    classe.Label AS classeLabel,\r\n"
					+ "    SeanceGenerique.MatiereID AS SeanceGeneriqueMatiereID,\r\n"
					+ "    matiere.Code AS matiereCode,\r\n"
					+ "    matiere.Nom_Fr AS matiereNom_Fr,\r\n"
					+ "    matiere.Nom_Ar AS matiereNom_Ar,\r\n"
					+ "    SeanceGenerique.ModuleID AS SeanceGeneriqueModuleID,\r\n"
					+ "    module.Code AS moduleCode,\r\n"
					+ "    module.Nom_Fr AS moduleNom_Fr,\r\n"
					+ "    module.Nom_Ar AS moduleNom_Ar,\r\n"
					+ "    SeanceGenerique.ProfesseurUtilisateurID AS SeanceGeneriqueProfesseurUtilisateurID,\r\n"
					+ "    utilisateur.Photo AS utilisateurPhoto,\r\n"
					+ "    utilisateur.Nom_Fr AS utilisateurNom_Fr,\r\n"
					+ "    utilisateur.Nom_Ar AS utilisateurNom_Ar,\r\n"
					+ "    utilisateur.Prenom_Fr AS utilisateurPrenom_Fr,\r\n"
					+ "    utilisateur.Prenom_Ar AS utilisateurPrenom_Ar,\r\n"
					+ "    utilisateur.Sexe AS utilisateurSexe,\r\n"
					+ "    utilisateur.Titre AS utilisateurTitre,\r\n"
					+ "    utilisateur.Cin AS utilisateurCin,\r\n"
					+ "    utilisateur.Nationalite AS utilisateurNationalite,\r\n"
					+ "    utilisateur.DateNais AS utilisateurDateNais,\r\n"
					+ "    utilisateur.LieuNais_Fr AS utilisateurLieuNais_Fr,\r\n"
					+ "    utilisateur.LieuNais_Ar AS utilisateurLieuNais_Ar,\r\n"
					+ "    utilisateur.Adresse_Fr AS utilisateurAdresse_Fr,\r\n"
					+ "    utilisateur.Adresse_Ar AS utilisateurAdresse_Ar,\r\n"
					+ "    utilisateur.Email AS utilisateurEmail,\r\n"
					+ "    utilisateur.SituationF AS utilisateurSituationF,\r\n"
					+ "    utilisateur.SituationF AS utilisateurSituationF,\r\n"
					+ "    utilisateur.TeleMobile AS utilisateurTeleMobile,\r\n"
					+ "    utilisateur.TeleDomicile AS utilisateurTeleDomicile,\r\n"
					+ "    professeur.CycleID AS professeurCycleID,\r\n"
					+ "    cycle.Code AS professeurCycleCode,\r\n"
					+ "    cycle.Nom_Fr AS professeurCycleNom,\r\n"
					+ "    cahiertexte_concept.ConceptID AS cahiertexte_conceptConceptID,\r\n"
					+ "    concept.Nom AS conceptNom,\r\n"
					+ "    chapitre.ID AS chapitreID,\r\n"
					+ "    chapitre.Nom AS chapitreNom\r\n"
					+ "FROM\r\n"
					+ "    cahiertexte,\r\n"
					+ "    seance,\r\n"
					+ "    seancegenerique,\r\n"
					+ "    classe,\r\n"
					+ "    classegenerique,\r\n"
					+ "    niveau,\r\n"
					+ "    filiere,\r\n"
					+ "    cycle,\r\n"
					+ "    anneescolaire,\r\n"
					+ "    matiere,\r\n"
					+ "    module,\r\n"
					+ "    professeur,\r\n"
					+ "    utilisateur,\r\n"
					+ "    salle,\r\n"
					+ "    typesalle,\r\n"
					+ "    bloc,\r\n"
					+ "    periode,\r\n"
					+ "    acrivitepedagogique,\r\n"
					+ "    cahiertexte_acrivitepedagogique,\r\n"
					+ "    cahiertexte_concept,\r\n"
					+ "    concept,\r\n"
					+ "    chapitre\r\n"
					+ "WHERE\r\n"
					+ "    cahiertexte.SeanceID = seance.ID AND seance.SeanceGeneriqueID = seancegenerique.ID AND "
					+ "cahiertexte_concept.CahierTexteID = cahiertexte.ID AND concept.ID = cahiertexte_concept.ConceptID "
					+ "AND seancegenerique.ClasseID = classe.ID AND cahiertexte_acrivitepedagogique.CahierTexteID = cahiertexte.ID "
					+ "AND acrivitepedagogique.ID = cahiertexte_acrivitepedagogique.AcrivitePedagogiqueID AND classe.ClasseGeneriqueID = classegenerique.ID "
					+ "AND classegenerique.NiveauID = niveau.ID AND classegenerique.FiliereID = filiere.ID AND classegenerique.CycleID = cycle.ID "
					+ "AND classe.AnneeScolaireID = anneescolaire.ID AND seancegenerique.MatiereID = matiere.ID AND seancegenerique.ModuleID = module.ID "
					+ "AND seancegenerique.ProfesseurUtilisateurID = professeur.UtilisateurID AND professeur.UtilisateurID = utilisateur.ID "
					+ "AND professeur.CycleID = cycle.ID AND salle.ID = seancegenerique.SalleID AND salle.TypeSalleID = typesalle.ID AND salle.BlocID = bloc.ID"
					+ " AND seancegenerique.PeriodeID = periode.ID AND chapitre.MatiereID = matiere.ID AND chapitre.ModuleID = module.ID "
					+ "AND concept.ChapitreID = chapitre.ID "
					+ "AND professeur.UtilisateurID = ? AND seancegenerique.ClasseID = ?";
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			statement.setInt(1, idProf);
			statement.setInt(2, idclass);
			ArrayList<CahierTexte> ct=new ArrayList<CahierTexte>();
			ResultSet rs=statement.executeQuery();
			while(rs.next()) {
				CahierTexte CahierTexte=new CahierTexte();
				
				CahierTexte.setId(rs.getInt("CahierTexteID"));
				CahierTexte.setTexte(rs.getString("cahiertexteTexte"));
				CahierTexte.setObservation(rs.getString("cahiertexteObservation"));
				CahierTexte.setEtat(rs.getString("cahiertexteEtat"));
//concept
//				
				Concept c=new Concept();
				c.setId(rs.getInt("cahiertexte_conceptConceptID"));
				c.setNom(rs.getString("conceptNom"));
				Chapitre Chapitre=new Chapitre();
				Chapitre.setId(rs.getInt("chapitreID"));
				Chapitre.setNom(rs.getString("chapitreNom"));
				c.setChapitre(Chapitre);
				CahierTexte.addConcept(c);

//seance
				Seance Seance = new Seance();	
				Seance.setId(rs.getInt("seanceID"));
				Seance.setDate(rs.getDate("seanceDate"));
				Seance.setEtat(rs.getString("seanceEtat"));
				Seance.setObservation(rs.getString("seanceObservation"));
				CahierTexte.setSeance(Seance);
				AcrivitePedagogique act = new AcrivitePedagogique();
				act.setId(rs.getInt("activiteID"));
				act.setCode(rs.getString("activiteCode"));
				act.setNom_Fr(rs.getString("activiteNomFr"));
				act.setNom_Ar(rs.getString("activiteNomAr"));
				CahierTexte.addActivite(act);
				
				SeanceGenerique SeanceGenerique= new SeanceGenerique();
				SeanceGenerique.setId(rs.getInt("seanceSeanceGeneriqueID"));
// class
				Classe Classe=new Classe();
				Classe.setId(rs.getInt("SeanceGeneriqueClasseID"));
//				Classe.setCode(rs.getInt("")); the code is auto generate by the other classes codes....
				Classe.setLabel(rs.getString("classeLabel"));

				ClasseGenerique ClasseGenerique= new ClasseGenerique();
				ClasseGenerique.setId(rs.getInt("classeClasseGeneriqueID"));
				ClasseGenerique.setDescription(rs.getString("classegeneriqueDescription"));
// Niveau
				Niveau Niveau=new Niveau();
				Niveau.setId(rs.getInt("classegeneriqueNiveauID"));
				Niveau.setCode(rs.getString("niveauCode"));
				Niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
				Niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
// Filiere 
				Filiere Filiere= new Filiere();
				Filiere.setId(rs.getInt("classegeneriqueFiliereID"));
				Filiere.setCode(rs.getString("filiereCode"));
				Filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
				Filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
//				Filiere Filiere= new Filiere(rs.getInt("classegeneriqueFiliereID"),rs.getString("filiereCode"),
//								rs.getString("filiereNom_Fr"),rs.getString("filiereNom_Ar"));
// Cycle
				Cycle Cycle=new Cycle();
				Cycle.setId(rs.getInt("classegeneriqueCycleID"));
				Cycle.setCode(rs.getString("cycleCode"));
				Cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
				Cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
//				Cycle Cycle=new Cycle(rs.getInt("classegeneriqueCycleID"),rs.getString("cycleCode"),
//									rs.getString("cycleNom_Fr"),rs.getString("cycleNom_Ar"));
				
// AnneeScolaire
				AnneeScolaire AnneeScolaire = new AnneeScolaire();
				AnneeScolaire.setId(rs.getInt("classeAnneeScolaireID"));
				AnneeScolaire.setCode(rs.getString("anneescolaireCode"));
				AnneeScolaire.setDateDebut(rs.getDate("anneescolaireDateDebut"));
				AnneeScolaire.setDateFin(rs.getDate("anneescolaireDateFin"));
// Matiere
				Matiere Matiere= new Matiere();
				Matiere.setId(rs.getInt("SeanceGeneriqueMatiereID"));
				Matiere.setCode(rs.getString("matiereCode"));
				Matiere.setNom_Ar(rs.getString("matiereNom_Fr"));
				Matiere.setNom_Fr(rs.getString("matiereNom_Ar"));
				
// Module
				Module Module =new Module();
				Module.setId(rs.getInt("SeanceGeneriqueModuleID"));
				Module.setCode(rs.getString("moduleCode"));
				Module.setNom_Fr(rs.getString("moduleNom_Fr"));
				Module.setNom_Ar(rs.getString("moduleNom_Ar"));
				SeanceGenerique.setModule(Module);
				
			
				
// Professeur
				Professeur Professeur = new Professeur(
						rs.getInt("SeanceGeneriqueProfesseurUtilisateurID"),
						rs.getString("utilisateurNom_Fr"),
						rs.getString("utilisateurNom_Ar"),
						rs.getString("utilisateurPrenom_Fr"),
						rs.getString("utilisateurPrenom_Ar"),
						rs.getString("utilisateurSexe"),
						rs.getString("utilisateurCin"),
						rs.getString("utilisateurNationalite"),
						rs.getDate("utilisateurDateNais"),
						rs.getString("utilisateurLieuNais_Fr"),
						rs.getString("utilisateurLieuNais_Ar"),
						rs.getString("utilisateurAdresse_Fr"),
						rs.getString("utilisateurAdresse_Ar"),
						rs.getString("utilisateurEmail"),
						rs.getString("utilisateurSituationF"),
						rs.getString("utilisateurTitre"),
						rs.getString("utilisateurTeleMobile"),
						rs.getString("utilisateurTeleDomicile"),
						rs.getString("utilisateurPhoto"),
						new Specialite(),
						new Cycle(rs.getInt("classegeneriqueCycleID"),
						rs.getString("CycleCode"),
						rs.getString("cycleNom_Fr"),
						rs.getString("cycleNom_Ar")) );
				
// Salle
//				Salle Salle=new Salle();
//				Salle.setId(rs.getInt("SeanceGeneriqueClasseID"));
//				Salle.setCode(rs.getString("salleCode"));
//				Salle.setNom_Ar(rs.getString("salleNom_Ar"));
//				Salle.setNom_Fr(rs.getString("salleNom_Fr"));
//				System.out.println(Salle);
//				TypeSalle tsalle=new TypeSalle();
//				tsalle.setId(idclass);
//				System.out.println(tsalle);
				
//				Salle Salle=new Salle(rs.getInt("SeanceGeneriqueSalleID"),rs.getString("salleCode"),
//						rs.getString("salleNom_Fr"),rs.getString("salleNom_Ar"),
//						new TypeSalle(rs.getInt("salleTypeSalleID"),rs.getString("typesalleCode"),
//						rs.getString("typesalleNom_Fr"),rs.getString("typesalleNom_Ar")),
//						new Bloc(rs.getInt("salleBlocID"),rs.getString("blocCode"),rs.getString("blocNom_Fr"),rs.getString("blocNom_Ar")));
//				
				
// Periode
				Periode Periode= new Periode();
				
//				SeanceGenerique.setJour(rs.getString("SeanceGeneriqueJour"));
//				SeanceGenerique.setHeureDebut(rs.getString("SeanceGeneriqueHeureDebut"));
//				SeanceGenerique.setHeureFin(rs.getString("SeanceGeneriqueHeureFin"));
//				SeanceGenerique.setDuree(rs.getShort("seancegeneriqueDuree"));
//				SeanceGenerique.setObservation(rs.getString("SeanceGeneriqueObservation"));
				Seance.setSeanceGenerique(SeanceGenerique);
				SeanceGenerique.setProfesseur(Professeur);
				SeanceGenerique.setPeriode(Periode);
				SeanceGenerique.setClasse(Classe);
				SeanceGenerique.setMatiere(Matiere);
				
//				SeanceGenerique.setSalle(Salle);
				Classe.setAnneeScolaire(AnneeScolaire);
				Classe.setClasseGenerique(ClasseGenerique);
				ClasseGenerique.setFiliere(Filiere);
				ClasseGenerique.setNiveau(Niveau);
//Ajouter Le cahierTexte dans la list
				ct.add(CahierTexte);
			}
			return ct;
	
	}
	
	public ArrayList<CahierTexte> getCahiertexteByProfClassMatiere(int idProf, int idclass,int MatiereId) throws SQLException{
		String sql="SELECT\r\n"
				+ "    cahiertexte.ID AS cahiertexteID,\r\n"
				+ "    cahiertexte.Texte AS cahiertexteTexte,\r\n"
				+ "    cahiertexte.Observation AS cahiertexteObservation,\r\n"
				+ "    cahiertexte.Etat AS cahiertexteEtat,\r\n"
				+ "    acrivitepedagogique.ID AS activiteID,\r\n"
				+ "    acrivitepedagogique.Code AS activiteCode,\r\n"
				+ "    acrivitepedagogique.Nom_Fr AS activiteNomFr,\r\n"
				+ "    acrivitepedagogique.Nom_Ar AS activiteNomAr,\r\n"
				+ "    seance.ID AS seanceID,\r\n"
				+ "    seance.SeanceGeneriqueID AS seanceSeanceGeneriqueID,\r\n"
				+ "    seance.Date AS seanceDate,\r\n"
				+ "    seance.Etat AS seanceEtat,\r\n"
				+ "    seance.Observation AS seanceObservation,\r\n"
				+ "    SeanceGenerique.ClasseID AS SeanceGeneriqueClasseID,\r\n"
				+ "    classe.ClasseGeneriqueID AS classeClasseGeneriqueID,\r\n"
				+ "    classegenerique.NiveauID AS classegeneriqueNiveauID,\r\n"
				+ "    niveau.Code AS niveauCode,\r\n"
				+ "    niveau.Nom_Fr AS niveauNom_Fr,\r\n"
				+ "    niveau.Nom_Ar AS niveauNom_Ar,\r\n"
				+ "    classegenerique.FiliereID AS classegeneriqueFiliereID,\r\n"
				+ "    filiere.Code AS filiereCode,\r\n"
				+ "    filiere.Nom_Fr AS filiereNom_Fr,\r\n"
				+ "    filiere.Nom_Ar AS filiereNom_Ar,\r\n"
				+ "    classegenerique.CycleID AS classegeneriqueCycleID,\r\n"
				+ "    cycle.Code AS cycleCode,\r\n"
				+ "    cycle.Nom_Fr cycleNom_Fr,\r\n"
				+ "    cycle.Nom_Ar AS cycleNom_Ar,\r\n"
				+ "    classegenerique.Description AS classegeneriqueDescription,\r\n"
				+ "    classe.AnneeScolaireID AS classeAnneeScolaireID,\r\n"
				+ "    anneescolaire.Code AS anneescolaireCode,\r\n"
				+ "    anneescolaire.DateDebut AS anneescolaireDateDebut,\r\n"
				+ "    anneescolaire.DateFin AS anneescolaireDateFin,\r\n"
				+ "    classe.Label AS classeLabel,\r\n"
				+ "    SeanceGenerique.MatiereID AS SeanceGeneriqueMatiereID,\r\n"
				+ "    matiere.Code AS matiereCode,\r\n"
				+ "    matiere.Nom_Fr AS matiereNom_Fr,\r\n"
				+ "    matiere.Nom_Ar AS matiereNom_Ar,\r\n"
				+ "    SeanceGenerique.ModuleID AS SeanceGeneriqueModuleID,\r\n"
				+ "    module.Code AS moduleCode,\r\n"
				+ "    module.Nom_Fr AS moduleNom_Fr,\r\n"
				+ "    module.Nom_Ar AS moduleNom_Ar,\r\n"
				+ "    SeanceGenerique.ProfesseurUtilisateurID AS SeanceGeneriqueProfesseurUtilisateurID,\r\n"
				+ "    utilisateur.Photo AS utilisateurPhoto,\r\n"
				+ "    utilisateur.Nom_Fr AS utilisateurNom_Fr,\r\n"
				+ "    utilisateur.Nom_Ar AS utilisateurNom_Ar,\r\n"
				+ "    utilisateur.Prenom_Fr AS utilisateurPrenom_Fr,\r\n"
				+ "    utilisateur.Prenom_Ar AS utilisateurPrenom_Ar,\r\n"
				+ "    utilisateur.Sexe AS utilisateurSexe,\r\n"
				+ "    utilisateur.Titre AS utilisateurTitre,\r\n"
				+ "    utilisateur.Cin AS utilisateurCin,\r\n"
				+ "    utilisateur.Nationalite AS utilisateurNationalite,\r\n"
				+ "    utilisateur.DateNais AS utilisateurDateNais,\r\n"
				+ "    utilisateur.LieuNais_Fr AS utilisateurLieuNais_Fr,\r\n"
				+ "    utilisateur.LieuNais_Ar AS utilisateurLieuNais_Ar,\r\n"
				+ "    utilisateur.Adresse_Fr AS utilisateurAdresse_Fr,\r\n"
				+ "    utilisateur.Adresse_Ar AS utilisateurAdresse_Ar,\r\n"
				+ "    utilisateur.Email AS utilisateurEmail,\r\n"
				+ "    utilisateur.SituationF AS utilisateurSituationF,\r\n"
				+ "    utilisateur.SituationF AS utilisateurSituationF,\r\n"
				+ "    utilisateur.TeleMobile AS utilisateurTeleMobile,\r\n"
				+ "    utilisateur.TeleDomicile AS utilisateurTeleDomicile,\r\n"
				+ "    professeur.CycleID AS professeurCycleID,\r\n"
				+ "    cycle.Code AS professeurCycleCode,\r\n"
				+ "    cycle.Nom_Fr AS professeurCycleNom,\r\n"
				+ "    cahiertexte_concept.ConceptID AS cahiertexte_conceptConceptID,\r\n"
				+ "    concept.Nom AS conceptNom,\r\n"
				+ "    chapitre.ID AS chapitreID,\r\n"
				+ "    chapitre.Nom AS chapitreNom\r\n"
				+ "FROM\r\n"
				+ "    cahiertexte,\r\n"
				+ "    seance,\r\n"
				+ "    seancegenerique,\r\n"
				+ "    classe,\r\n"
				+ "    classegenerique,\r\n"
				+ "    niveau,\r\n"
				+ "    filiere,\r\n"
				+ "    cycle,\r\n"
				+ "    anneescolaire,\r\n"
				+ "    matiere,\r\n"
				+ "    module,\r\n"
				+ "    professeur,\r\n"
				+ "    utilisateur,\r\n"
				+ "    salle,\r\n"
				+ "    typesalle,\r\n"
				+ "    bloc,\r\n"
				+ "    periode,\r\n"
				+ "    acrivitepedagogique,\r\n"
				+ "    cahiertexte_acrivitepedagogique,\r\n"
				+ "    cahiertexte_concept,\r\n"
				+ "    concept,\r\n"
				+ "    chapitre\r\n"
				+ "WHERE\r\n"
				+ "    cahiertexte.SeanceID = seance.ID AND seance.SeanceGeneriqueID = seancegenerique.ID AND "
				+ "cahiertexte_concept.CahierTexteID = cahiertexte.ID AND concept.ID = cahiertexte_concept.ConceptID "
				+ "AND seancegenerique.ClasseID = classe.ID AND cahiertexte_acrivitepedagogique.CahierTexteID = cahiertexte.ID "
				+ "AND acrivitepedagogique.ID = cahiertexte_acrivitepedagogique.AcrivitePedagogiqueID AND classe.ClasseGeneriqueID = classegenerique.ID "
				+ "AND classegenerique.NiveauID = niveau.ID AND classegenerique.FiliereID = filiere.ID AND classegenerique.CycleID = cycle.ID "
				+ "AND classe.AnneeScolaireID = anneescolaire.ID AND seancegenerique.MatiereID = matiere.ID AND seancegenerique.ModuleID = module.ID "
				+ "AND seancegenerique.ProfesseurUtilisateurID = professeur.UtilisateurID AND professeur.UtilisateurID = utilisateur.ID "
				+ "AND professeur.CycleID = cycle.ID AND salle.ID = seancegenerique.SalleID AND salle.TypeSalleID = typesalle.ID AND salle.BlocID = bloc.ID"
				+ " AND seancegenerique.PeriodeID = periode.ID AND chapitre.MatiereID = matiere.ID AND chapitre.ModuleID = module.ID "
				+ "AND concept.ChapitreID = chapitre.ID "
				+ "AND professeur.UtilisateurID = ? AND seancegenerique.ClasseID = ? AND matiere.ID=?";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
		statement.setInt(1, idProf);
		statement.setInt(2, idclass);
		statement.setInt(3, MatiereId);
		ArrayList<CahierTexte> ct=new ArrayList<CahierTexte>();
		ResultSet rs=statement.executeQuery();
		while(rs.next()) {
			CahierTexte CahierTexte=new CahierTexte();
			
			CahierTexte.setId(rs.getInt("CahierTexteID"));
			CahierTexte.setTexte(rs.getString("cahiertexteTexte"));
			CahierTexte.setObservation(rs.getString("cahiertexteObservation"));
			CahierTexte.setEtat(rs.getString("cahiertexteEtat"));
//concept
//			
			Concept c=new Concept();
			c.setId(rs.getInt("cahiertexte_conceptConceptID"));
			c.setNom(rs.getString("conceptNom"));
			Chapitre Chapitre=new Chapitre();
			Chapitre.setId(rs.getInt("chapitreID"));
			Chapitre.setNom(rs.getString("chapitreNom"));
			c.setChapitre(Chapitre);
			CahierTexte.addConcept(c);

//seance
			Seance Seance = new Seance();	
			Seance.setId(rs.getInt("seanceID"));
			Seance.setDate(rs.getDate("seanceDate"));
			Seance.setEtat(rs.getString("seanceEtat"));
			Seance.setObservation(rs.getString("seanceObservation"));
			CahierTexte.setSeance(Seance);
			AcrivitePedagogique act = new AcrivitePedagogique();
			act.setId(rs.getInt("activiteID"));
			act.setCode(rs.getString("activiteCode"));
			act.setNom_Fr(rs.getString("activiteNomFr"));
			act.setNom_Ar(rs.getString("activiteNomAr"));
			CahierTexte.addActivite(act);
			
			SeanceGenerique SeanceGenerique= new SeanceGenerique();
			SeanceGenerique.setId(rs.getInt("seanceSeanceGeneriqueID"));
//class
			Classe Classe=new Classe();
			Classe.setId(rs.getInt("SeanceGeneriqueClasseID"));
//			Classe.setCode(rs.getInt("")); the code is auto generate by the other classes codes....
			Classe.setLabel(rs.getString("classeLabel"));

			ClasseGenerique ClasseGenerique= new ClasseGenerique();
			ClasseGenerique.setId(rs.getInt("classeClasseGeneriqueID"));
			ClasseGenerique.setDescription(rs.getString("classegeneriqueDescription"));
//Niveau
			Niveau Niveau=new Niveau();
			Niveau.setId(rs.getInt("classegeneriqueNiveauID"));
			Niveau.setCode(rs.getString("niveauCode"));
			Niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
			Niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
//Filiere 
			Filiere Filiere= new Filiere();
			Filiere.setId(rs.getInt("classegeneriqueFiliereID"));
			Filiere.setCode(rs.getString("filiereCode"));
			Filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
			Filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
//			Filiere Filiere= new Filiere(rs.getInt("classegeneriqueFiliereID"),rs.getString("filiereCode"),
//							rs.getString("filiereNom_Fr"),rs.getString("filiereNom_Ar"));
//Cycle
			Cycle Cycle=new Cycle();
			Cycle.setId(rs.getInt("classegeneriqueCycleID"));
			Cycle.setCode(rs.getString("cycleCode"));
			Cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
			Cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
//			Cycle Cycle=new Cycle(rs.getInt("classegeneriqueCycleID"),rs.getString("cycleCode"),
//								rs.getString("cycleNom_Fr"),rs.getString("cycleNom_Ar"));
			
//AnneeScolaire
			AnneeScolaire AnneeScolaire = new AnneeScolaire();
			AnneeScolaire.setId(rs.getInt("classeAnneeScolaireID"));
			AnneeScolaire.setCode(rs.getString("anneescolaireCode"));
			AnneeScolaire.setDateDebut(rs.getDate("anneescolaireDateDebut"));
			AnneeScolaire.setDateFin(rs.getDate("anneescolaireDateFin"));
//Matiere
			Matiere Matiere= new Matiere();
			Matiere.setId(rs.getInt("SeanceGeneriqueMatiereID"));
			Matiere.setCode(rs.getString("matiereCode"));
			Matiere.setNom_Ar(rs.getString("matiereNom_Fr"));
			Matiere.setNom_Fr(rs.getString("matiereNom_Ar"));
			
//Module
			Module Module =new Module();
			Module.setId(rs.getInt("SeanceGeneriqueModuleID"));
			Module.setCode(rs.getString("moduleCode"));
			Module.setNom_Fr(rs.getString("moduleNom_Fr"));
			Module.setNom_Ar(rs.getString("moduleNom_Ar"));
			SeanceGenerique.setModule(Module);
			
		
			
//Professeur
			Professeur Professeur = new Professeur(
					rs.getInt("SeanceGeneriqueProfesseurUtilisateurID"),
					rs.getString("utilisateurNom_Fr"),
					rs.getString("utilisateurNom_Ar"),
					rs.getString("utilisateurPrenom_Fr"),
					rs.getString("utilisateurPrenom_Ar"),
					rs.getString("utilisateurSexe"),
					rs.getString("utilisateurCin"),
					rs.getString("utilisateurNationalite"),
					rs.getDate("utilisateurDateNais"),
					rs.getString("utilisateurLieuNais_Fr"),
					rs.getString("utilisateurLieuNais_Ar"),
					rs.getString("utilisateurAdresse_Fr"),
					rs.getString("utilisateurAdresse_Ar"),
					rs.getString("utilisateurEmail"),
					rs.getString("utilisateurSituationF"),
					rs.getString("utilisateurTitre"),
					rs.getString("utilisateurTeleMobile"),
					rs.getString("utilisateurTeleDomicile"),
					rs.getString("utilisateurPhoto"),
					new Specialite(),
					new Cycle(rs.getInt("classegeneriqueCycleID"),
					rs.getString("CycleCode"),
					rs.getString("cycleNom_Fr"),
					rs.getString("cycleNom_Ar")) );
			
//Salle
//			Salle Salle=new Salle();
//			Salle.setId(rs.getInt("SeanceGeneriqueClasseID"));
//			Salle.setCode(rs.getString("salleCode"));
//			Salle.setNom_Ar(rs.getString("salleNom_Ar"));
//			Salle.setNom_Fr(rs.getString("salleNom_Fr"));
//			System.out.println(Salle);
//			TypeSalle tsalle=new TypeSalle();
//			tsalle.setId(idclass);
//			System.out.println(tsalle);
			
//			Salle Salle=new Salle(rs.getInt("SeanceGeneriqueSalleID"),rs.getString("salleCode"),
//					rs.getString("salleNom_Fr"),rs.getString("salleNom_Ar"),
//					new TypeSalle(rs.getInt("salleTypeSalleID"),rs.getString("typesalleCode"),
//					rs.getString("typesalleNom_Fr"),rs.getString("typesalleNom_Ar")),
//					new Bloc(rs.getInt("salleBlocID"),rs.getString("blocCode"),rs.getString("blocNom_Fr"),rs.getString("blocNom_Ar")));
//			
			
//Periode
			Periode Periode= new Periode();
			
//			SeanceGenerique.setJour(rs.getString("SeanceGeneriqueJour"));
//			SeanceGenerique.setHeureDebut(rs.getString("SeanceGeneriqueHeureDebut"));
//			SeanceGenerique.setHeureFin(rs.getString("SeanceGeneriqueHeureFin"));
//			SeanceGenerique.setDuree(rs.getShort("seancegeneriqueDuree"));
//			SeanceGenerique.setObservation(rs.getString("SeanceGeneriqueObservation"));
			Seance.setSeanceGenerique(SeanceGenerique);
			SeanceGenerique.setProfesseur(Professeur);
			SeanceGenerique.setPeriode(Periode);
			SeanceGenerique.setClasse(Classe);
			SeanceGenerique.setMatiere(Matiere);
			
//			SeanceGenerique.setSalle(Salle);
			Classe.setAnneeScolaire(AnneeScolaire);
			Classe.setClasseGenerique(ClasseGenerique);
			ClasseGenerique.setFiliere(Filiere);
			ClasseGenerique.setNiveau(Niveau);
//Ajouter Le cahierTexte dans la list
			ct.add(CahierTexte);
		}
		return ct;

}
	public ArrayList<Utilisateur> getAllprof() throws SQLException{  
		String sql="SELECT\r\n"
				+ "    `professeur`.`UtilisateurID` AS 'UtilisateurID',\r\n"
				+ "    `professeur`.`CycleID` AS 'Cycle',\r\n"
				+ "    `professeur`.`SpecialiteID` AS 'Specialite',\r\n"
				+ "    `utilisateur`.`Photo` AS 'Photo',\r\n"
				+ "    `utilisateur`.`Nom_Fr` AS 'Nom_fr',\r\n"
				+ "    `utilisateur`.`Nom_Ar` AS 'Nom_Ar',\r\n"
				+ "    `utilisateur`.`Prenom_Fr` AS 'Prenom_Fr',\r\n"
				+ "    `utilisateur`.`Prenom_Ar` AS 'Prenom_Ar',\r\n"
				+ "    `utilisateur`.`Sexe` AS 'Sexe',\r\n"
				+ "    `utilisateur`.`Titre` AS 'Titre',\r\n"
				+ "    `utilisateur`.`Cin` AS 'Cin',\r\n"
				+ "    `utilisateur`.`Nationalite` AS 'Nationalite',\r\n"
				+ "    `utilisateur`.`DateNais` AS 'DateNais',\r\n"
				+ "    `utilisateur`.`LieuNais_Fr` AS 'LieuNais_Fr',\r\n"
				+ "    `utilisateur`.`LieuNais_Ar` AS 'LieuNais_Ar',\r\n"
				+ "    `utilisateur`.`Adresse_Fr` AS 'Adresse_Fr',\r\n"
				+ "    `utilisateur`.`Adresse_Ar` AS 'Adresse_Ar',\r\n"
				+ "    `utilisateur`.`Email` AS 'Email',\r\n"
				+ "    `utilisateur`.`SituationF` AS 'SituationF',\r\n"
				+ "    `utilisateur`.`TeleMobile` AS 'TeleMobile',\r\n"
				+ "    `utilisateur`.`TeleDomicile` AS 'TeleDomicile'\r\n"
				+ "FROM\r\n"
				+ "    utilisateur,\r\n"
				+ "    professeur\r\n"
				+ "WHERE\r\n"
				+ "    utilisateur.ID = professeur.UtilisateurID";
		
			ArrayList<Utilisateur> tab=new ArrayList<Utilisateur>();
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			Utilisateur p=null;
			while(rs.next()) {
				p=new Utilisateur();
				p.setId(rs.getInt("UtilisateurID"));
				p.setNom_Fr(rs.getString("Nom_Fr"));
				p.setPrenom_Fr(rs.getString("Prenom_Fr"));
				p.setNom_Ar(rs.getString("Nom_Ar"));
				p.setPrenom_Ar(rs.getString("Prenom_Ar"));
				p.setAdresse_Ar(rs.getString("Adresse_Ar"));
				p.setAdresse_Fr(rs.getString("Adresse_Fr"));
				p.setSexe(rs.getString("Sexe"));
				p.setDateNais(rs.getDate("DateNais"));
				p.setEmail(rs.getString("Email"));
				p.setPhoto(rs.getString("Photo"));
				p.setTeleDomicile(rs.getString("TeleDomicile"));
				p.setTeleMobile(rs.getString("TeleMobile"));
				p.setTitre(rs.getString("Titre"));
				p.setNationalite(rs.getString("Nationalite"));
				p.setAdresse_Ar(rs.getString("Adresse_Ar"));
				p.setAdresse_Fr(rs.getString("Adresse_Fr"));
				p.setSituationF(rs.getString("SituationF"));
				p.setLieuNais_Ar(rs.getString("LieuNais_Ar"));
				p.setLieuNais_Fr(rs.getString("LieuNais_Fr"));
				tab.add(p);
			}
			return tab;

	}
	public ArrayList<CahierTexte> getAll(){
		String sql="select \r\n"
				+ "cahiertexte.ID AS cahiertexteID,\r\n"
				+ "cahiertexte.Texte as cahiertexteTexte ,\r\n"
				+ "cahiertexte.Observation as cahiertexteObservation,\r\n"
				+ "cahiertexte.Etat as cahiertexteEtat,\r\n"
				+ "seance.ID as seanceID,\r\n"
				+ "seance.SeanceGeneriqueID as seanceSeanceGeneriqueID ,\r\n"
				+ "seance.Date as seanceDate,\r\n"
				+ "seance.Etat as seanceEtat,\r\n"
				+ "seance.Observation as seanceObservation,\r\n"
				+ "SeanceGenerique.ClasseID as SeanceGeneriqueClasseID,\r\n"
				+ "classe.ClasseGeneriqueID as classeClasseGeneriqueID,\r\n"
				+ "classegenerique.NiveauID as classegeneriqueNiveauID,\r\n"
				+ "niveau.Code as niveauCode,\r\n"
				+ "niveau.Nom_Fr as niveauNom_Fr,\r\n"
				+ "niveau.Nom_Ar as niveauNom_Ar,\r\n"
				+ "classegenerique.FiliereID as classegeneriqueFiliereID,\r\n"
				+ "filiere.Code as filiereCode,\r\n" 
				+ "filiere.Nom_Fr as filiereNom_Fr,\r\n"
				+ "filiere.Nom_Ar as filiereNom_Ar,\r\n"
				+ "classegenerique.CycleID as classegeneriqueCycleID,\r\n"
				+ "cycle.Code as cycleCode ,\r\n"
				+ "cycle.Nom_Fr cycleNom_Fr,\r\n"
				+ "cycle.Nom_Ar as cycleNom_Ar,\r\n"
				+ "classegenerique.Description as classegeneriqueDescription,\r\n"
				+ "classe.AnneeScolaireID as classeAnneeScolaireID,\r\n"
				+ "anneescolaire.Code as  anneescolaireCode,\r\n"
				+ "anneescolaire.DateDebut as anneescolaireDateDebut,\r\n"
				+ "anneescolaire.DateFin as anneescolaireDateFin,\r\n"
				+ "classe.Label as classeLabel,\r\n"
				+ "\r\n"
				+ "SeanceGenerique.MatiereID as SeanceGeneriqueMatiereID,\r\n"
				+ "matiere.Code as matiereCode,\r\n"
				+ "matiere.Nom_Fr as matiereNom_Fr,\r\n"
				+ "matiere.Nom_Ar as matiereNom_Ar,\r\n"
				+ "SeanceGenerique.ModuleID as SeanceGeneriqueModuleID,\r\n"
				+ "module.Code as moduleCode,\r\n"
				+ "module.Nom_Fr as moduleNom_Fr,\r\n"
				+ "module.Nom_Ar as moduleNom_Ar,\r\n"
				+ "\r\n"
				+ "SeanceGenerique.ProfesseurUtilisateurID as SeanceGeneriqueProfesseurUtilisateurID,\r\n"
				+ "utilisateur.Photo as utilisateurPhoto,\r\n"
				+ "utilisateur.Nom_Fr as utilisateurNom_Fr,\r\n"
				+ "utilisateur.Nom_Ar as utilisateurNom_Ar,\r\n"
				+ "utilisateur.Prenom_Fr as utilisateurPrenom_Fr,\r\n"
				+ "utilisateur.Prenom_Ar as utilisateurPrenom_Ar,\r\n"
				+ "utilisateur.Sexe as utilisateurSexe,\r\n"
				+ "utilisateur.Titre as utilisateurTitre,\r\n"
				+ "utilisateur.Cin as utilisateurCin,\r\n"
				+ "utilisateur.Nationalite as utilisateurNationalite,\r\n"
				+ "utilisateur.DateNais as utilisateurDateNais,\r\n"
				+ "utilisateur.LieuNais_Fr as utilisateurLieuNais_Fr,\r\n"
				+ "utilisateur.LieuNais_Ar as utilisateurLieuNais_Ar,\r\n"
				+ "utilisateur.Adresse_Fr as utilisateurAdresse_Fr,\r\n"
				+ "utilisateur.Adresse_Ar as utilisateurAdresse_Ar,\r\n"
				+ "utilisateur.Email as utilisateurEmail,\r\n"
				+ "utilisateur.SituationF as utilisateurSituationF,\r\n"
				+ "utilisateur.TeleMobile as utilisateurTeleMobile,\r\n"
				+ "utilisateur.TeleDomicile as utilisateurTeleDomicile,\r\n"
				+ "\r\n"
				+ "professeur.CycleID as professeurCycleID,\r\n"
				+ "cycle.Code as professeurCycleCode,\r\n"
				+ "cycle.Nom_Fr as professeurCycleNom_Fr,\r\n"
				+ "cycle.Nom_Ar as professeurCycleNom_Ar,\r\n"
				+ "professeur.SpecialiteID as professeurSpecialiteID,\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "SeanceGenerique.SalleID as SeanceGeneriqueSalleID,\r\n"
				+ "salle.TypeSalleID as salleTypeSalleID,\r\n"
				+ "typesalle.Code as typesalleCode,\r\n"
				+ "typesalle.Nom_Fr as typesalleNom_Fr,\r\n"
				+ "typesalle.Nom_Ar as typesalleNom_Ar,\r\n"
				+ "salle.BlocID as salleBlocID,\r\n"
				+ "bloc.Code as blocCode ,\r\n"
				+ "bloc.Nom_Fr as blocNom_Fr,\r\n"
				+ "bloc.Nom_Ar as blocNom_Ar,\r\n"
				+ "salle.Code as salleCode,\r\n"
				+ "salle.Nom_Fr as salleNom_Fr,\r\n"
				+ "salle.Nom_Ar as salleNom_Ar,\r\n"
				+ "\r\n"
				+ "SeanceGenerique.PeriodeID as SeanceGeneriquePeriodeID,\r\n"
				+ "periode.Code as periodeCode,\r\n"
				+ "periode.Nom_Fr as periodeNom_Fr,\r\n"
				+ "periode.Nom_Ar as periodeNom_Ar,\r\n"
				+ "SeanceGenerique.Jour as SeanceGeneriqueJour,\r\n"
				+ "SeanceGenerique.HeureDebut as SeanceGeneriqueHeureDebut,\r\n"
				+ "SeanceGenerique.HeureFin as SeanceGeneriqueHeureFin,\r\n"
				+ "seancegenerique.Duree as seancegeneriqueDuree,\r\n"
				+ "SeanceGenerique.Observation as SeanceGeneriqueObservation\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "from cahiertexte,seance,seancegenerique ,classe,classegenerique,niveau,filiere,cycle,anneescolaire,matiere,module,professeur,utilisateur,salle,typesalle,bloc,periode where cahiertexte.SeanceID=seance.ID and seance.SeanceGeneriqueID=seancegenerique.ID and seancegenerique.ClasseID=classe.ID and classe.ClasseGeneriqueID=classegenerique.ID and classegenerique.NiveauID=niveau.ID and classegenerique.FiliereID=filiere.ID and classegenerique.CycleID=cycle.ID and classe.AnneeScolaireID=anneescolaire.ID and seancegenerique.MatiereID=matiere.ID and seancegenerique.ModuleID=module.ID and seancegenerique.ProfesseurUtilisateurID=professeur.UtilisateurID and \r\n"
				+ "professeur.UtilisateurID=utilisateur.ID and \r\n"
				+ "professeur.CycleID=cycle.ID and \r\n"
				+ "salle.ID=seancegenerique.SalleID and salle.TypeSalleID=typesalle.ID and salle.BlocID=bloc.ID and seancegenerique.PeriodeID=periode.ID  ;";
		try {
			ArrayList<CahierTexte> tab=new ArrayList<CahierTexte>();
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs=statement.executeQuery();
			CahierTexte CahierTexte=null;
			while(rs.next()) {
			 	CahierTexte=new CahierTexte();
			 	
				CahierTexte.setId(rs.getInt("CahierTexte-ID"));
				CahierTexte.setTexte(rs.getString("cahiertexteTexte"));
				CahierTexte.setObservation(rs.getString("cahiertexteObservation"));
				CahierTexte.setEtat(rs.getString("cahiertexteEtat"));
// seance
				Seance Seance = new Seance();	
				Seance.setId(rs.getInt("seanceID"));
				Seance.setDate(rs.getDate("seanceDate"));
				Seance.setEtat(rs.getString("seanceEtat"));
				Seance.setObservation(rs.getString("seanceObservation"));
				CahierTexte.setSeance(Seance);
				
				
				SeanceGenerique SeanceGenerique= new SeanceGenerique();
				SeanceGenerique.setId(rs.getInt("seanceSeanceGeneriqueID"));
// class
				Classe Classe=new Classe();
				Classe.setId(rs.getInt("SeanceGeneriqueClasseID"));
//				Classe.setCode(rs.getInt("")); the code is auto generate by the other classes codes....
				Classe.setLabel(rs.getString("classeLabel"));

				ClasseGenerique ClasseGenerique= new ClasseGenerique();
				ClasseGenerique.setId(rs.getInt("classeClasseGeneriqueID"));
				ClasseGenerique.setDescription(rs.getString("classegeneriqueDescription"));

// Niveau
				Niveau Niveau=new Niveau();
				Niveau.setId(rs.getInt("classegeneriqueNiveauID"));
				Niveau.setCode(rs.getString("niveauCode"));
				Niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
				Niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
				
// Filiere 
				Filiere Filiere= new Filiere(rs.getInt("classegeneriqueFiliereID"),rs.getString("filiereCode"),
								rs.getString("filiereNom_Fr"),rs.getString("filiereNom_Ar"));
// Cycle
				Cycle Cycle=new Cycle(rs.getInt("classegeneriqueCycleID"),rs.getString("cycleCode"),
									rs.getString("cycleNom_Fr"),rs.getString("cycleNom_Ar"));
				
// AnneeScolaire
				AnneeScolaire AnneeScolaire = new AnneeScolaire();
				AnneeScolaire.setId(rs.getInt("classeAnneeScolaireID"));
				AnneeScolaire.setCode(rs.getString("anneescolaireCode"));
				AnneeScolaire.setDateDebut(rs.getDate("anneescolaireDateDebut"));
				AnneeScolaire.setDateFin(rs.getDate("anneescolaireDateFin"));
				
// Matiere
				Matiere Matiere= new Matiere();
				Matiere.setId(rs.getInt("SeanceGeneriqueMatiereID"));
				Matiere.setCode(rs.getString("matiereCode"));
				Matiere.setNom_Ar(rs.getString("matiereNom_Fr"));
				Matiere.setNom_Fr(rs.getString("matiereNom_Ar"));
				
				
// Module
//				Module Module =new Module(null);
// Professeur
				
				Professeur Professeur = new Professeur(
						rs.getInt("SeanceGeneriqueProfesseurUtilisateurID"),
						rs.getString("utilisateurNom_Fr"),
						rs.getString("utilisateurNom_Ar"),
						rs.getString("utilisateurPrenom_Fr"),
						rs.getString("utilisateurPrenom_Ar"),
						rs.getString("utilisateurSexe"),
						rs.getString("utilisateurCin"),
						rs.getString("utilisateurNationalite"),
						rs.getDate("utilisateurDateNais"),
						rs.getString("utilisateurLieuNais_Fr"),
						rs.getString("utilisateurLieuNais_Ar"),
						rs.getString("utilisateurAdresse_Fr"),
						rs.getString("utilisateurAdresse_Ar"),
						rs.getString("utilisateurEmail"),
						rs.getString("utilisateurSituationF"),
						rs.getString("utilisateurTitre"),
						rs.getString("utilisateurTeleMobile"),
						rs.getString("utilisateurTeleDomicile"),
						rs.getString("utilisateurPhoto"),
						new Specialite(),
						new Cycle(rs.getInt("professeurCycleID"),rs.getString("professeurCycleCode"),
						rs.getString("professeurCycleNom_Fr"),rs.getString("professeurCycleNom_Ar")) );
				
				
// Salle
				Salle Salle=new Salle(rs.getInt("SeanceGeneriqueSalleID"),rs.getString("salleCode"),
						rs.getString("salleNom_Fr"),rs.getString("salleNom_Ar"),
						new TypeSalle(rs.getInt("salleTypeSalleID"),rs.getString("typesalleCode"),
						rs.getString("typesalleNom_Fr"),rs.getString("typesalleNom_Ar")),
						new Bloc(rs.getInt("salleBlocID"),rs.getString("blocCode"),rs.getString("blocNom_Fr"),rs.getString("blocNom_Ar")));
				
				
// Periode
				Periode Periode= new Periode();
				
				SeanceGenerique.setJour(rs.getString("SeanceGeneriqueJour"));
				SeanceGenerique.setHeureDebut(rs.getString("SeanceGeneriqueHeureDebut"));
				SeanceGenerique.setHeureFin(rs.getString("SeanceGeneriqueHeureFin"));
				SeanceGenerique.setDuree(rs.getShort("seancegeneriqueDuree"));
				SeanceGenerique.setObservation(rs.getString("SeanceGeneriqueObservation"));
				Seance.setSeanceGenerique(SeanceGenerique);
				SeanceGenerique.setProfesseur(Professeur);
				SeanceGenerique.setPeriode(Periode);
				SeanceGenerique.setClasse(Classe);
				SeanceGenerique.setMatiere(Matiere);
				SeanceGenerique.setModule(null);
				SeanceGenerique.setSalle(Salle);
				Classe.setAnneeScolaire(AnneeScolaire);
				Classe.setClasseGenerique(ClasseGenerique);
				ClasseGenerique.setFiliere(Filiere);
				ClasseGenerique.setNiveau(Niveau);
//Ajouter Le cahierTexte dans la list
				tab.add(CahierTexte);
			}
			return tab;
		} catch (SQLException e) {

			return null;
		}
		
	}
	
	public CahierTexte getCahiertexteById(int id) throws SQLException{
		
			String sql="SELECT\r\n"
					+ "    cahiertexte.ID AS cahiertexteID,\r\n"
					+ "    cahiertexte.Texte AS cahiertexteTexte,\r\n"
					+ "    cahiertexte.Observation AS cahiertexteObservation,\r\n"
					+ "    cahiertexte.Etat AS cahiertexteEtat,\r\n"
					+ "    acrivitepedagogique.ID as activiteID,\r\n"
					+ "    acrivitepedagogique.Code as activiteCode,\r\n"
					+ "    acrivitepedagogique.Nom_Fr as activiteNomFr,\r\n"
					+ "    acrivitepedagogique.Nom_Ar as activiteNomAr,\r\n"
					+ "    seance.ID AS seanceID,\r\n"
					+ "    seance.SeanceGeneriqueID AS seanceSeanceGeneriqueID,\r\n"
					+ "    seance.Date AS seanceDate,\r\n"
					+ "    seance.Etat AS seanceEtat,\r\n"
					+ "    seance.Observation AS seanceObservation,\r\n"
					+ "    SeanceGenerique.ClasseID AS SeanceGeneriqueClasseID,\r\n"
					+ "    classe.ClasseGeneriqueID AS classeClasseGeneriqueID,\r\n"
					+ "    classegenerique.NiveauID AS classegeneriqueNiveauID,\r\n"
					+ "    niveau.Code AS niveauCode,\r\n"
					+ "    niveau.Nom_Fr AS niveauNom_Fr,\r\n"
					+ "    niveau.Nom_Ar AS niveauNom_Ar,\r\n"
					+ "    classegenerique.FiliereID AS classegeneriqueFiliereID,\r\n"
					+ "    filiere.Code AS filiereCode,\r\n"
					+ "    filiere.Nom_Fr AS filiereNom_Fr,\r\n"
					+ "    filiere.Nom_Ar AS filiereNom_Ar,\r\n"
					+ "    classegenerique.CycleID AS classegeneriqueCycleID,\r\n"
					+ "    cycle.Code AS cycleCode,\r\n"
					+ "    cycle.Nom_Fr cycleNom_Fr,\r\n"
					+ "    cycle.Nom_Ar AS cycleNom_Ar,\r\n"
					+ "    classegenerique.Description AS classegeneriqueDescription,\r\n"
					+ "    classe.AnneeScolaireID AS classeAnneeScolaireID,\r\n"
					+ "    anneescolaire.Code AS anneescolaireCode,\r\n"
					+ "    anneescolaire.DateDebut AS anneescolaireDateDebut,\r\n"
					+ "    anneescolaire.DateFin AS anneescolaireDateFin,\r\n"
					+ "    classe.Label AS classeLabel,\r\n"
					+ "    SeanceGenerique.MatiereID AS SeanceGeneriqueMatiereID,\r\n"
					+ "    matiere.Code AS matiereCode,\r\n"
					+ "    matiere.Nom_Fr AS matiereNom_Fr,\r\n"
					+ "    matiere.Nom_Ar AS matiereNom_Ar,\r\n"
					+ "    SeanceGenerique.ModuleID AS SeanceGeneriqueModuleID,\r\n"
					+ "    module.Code AS moduleCode,\r\n"
					+ "    module.Nom_Fr AS moduleNom_Fr,\r\n"
					+ "    module.Nom_Ar AS moduleNom_Ar,\r\n"
					+ "    SeanceGenerique.ProfesseurUtilisateurID AS SeanceGeneriqueProfesseurUtilisateurID,\r\n"
					+ "    utilisateur.Photo AS utilisateurPhoto,\r\n"
					+ "    utilisateur.Nom_Fr AS utilisateurNom_Fr,\r\n"
					+ "    utilisateur.Nom_Ar AS utilisateurNom_Ar,\r\n"
					+ "    utilisateur.Prenom_Fr AS utilisateurPrenom_Fr,\r\n"
					+ "    utilisateur.Prenom_Ar AS utilisateurPrenom_Ar,\r\n"
					+ "    utilisateur.Sexe AS utilisateurSexe,\r\n"
					+ "    utilisateur.Titre AS utilisateurTitre,\r\n"
					+ "    utilisateur.Cin AS utilisateurCin,\r\n"
					+ "    utilisateur.Nationalite AS utilisateurNationalite,\r\n"
					+ "    utilisateur.DateNais AS utilisateurDateNais,\r\n"
					+ "    utilisateur.LieuNais_Fr AS utilisateurLieuNais_Fr,\r\n"
					+ "    utilisateur.LieuNais_Ar AS utilisateurLieuNais_Ar,\r\n"
					+ "    utilisateur.Adresse_Fr AS utilisateurAdresse_Fr,\r\n"
					+ "    utilisateur.Adresse_Ar AS utilisateurAdresse_Ar,\r\n"
					+ "    utilisateur.Email AS utilisateurEmail,\r\n"
					+ "    utilisateur.SituationF AS utilisateurSituationF,\r\n"
					+ "    utilisateur.TeleMobile AS utilisateurTeleMobile,\r\n"
					+ "					utilisateur.TeleDomicile AS utilisateurTeleDomicile,\r\n"
					+ "					    professeur.CycleID AS professeurCycleID,\r\n"
					+ "					    cycle.Code AS professeurCycleCode,\r\n"
					+ "					    cycle.Nom_Fr AS professeurCycleNom\r\n"
					+ "					FROM\r\n"
					+ "    cahiertexte,\r\n"
					+ "    seance,\r\n"
					+ "    seancegenerique,\r\n"
					+ "    classe,\r\n"
					+ "    classegenerique,\r\n"
					+ "    niveau,\r\n"
					+ "    filiere,\r\n"
					+ "    cycle,\r\n"
					+ "    anneescolaire,\r\n"
					+ "    matiere,\r\n"
					+ "    module,\r\n"
					+ "    professeur,\r\n"
					+ "    utilisateur,\r\n"
					+ "    salle,\r\n"
					+ "    typesalle,\r\n"
					+ "    bloc,\r\n"
					+ "    periode,\r\n"
					+ "    acrivitepedagogique,\r\n"
					+ "    cahiertexte_acrivitepedagogique\r\n"
					+ "					WHERE\r\n"
					+ "					cahiertexte.SeanceID = seance.ID AND\r\n"
					+ "    seance.SeanceGeneriqueID = seancegenerique.ID AND\r\n"
					+ "    seancegenerique.ClasseID = classe.ID AND\r\n"
					+ "    cahiertexte_acrivitepedagogique.CahierTexteID=cahiertexte.ID and\r\n"
					+ "    acrivitepedagogique.ID = cahiertexte_acrivitepedagogique.AcrivitePedagogiqueID AND classe.ClasseGeneriqueID = classegenerique.ID AND classegenerique.NiveauID = niveau.ID AND classegenerique.FiliereID = filiere.ID AND classegenerique.CycleID = cycle.ID AND classe.AnneeScolaireID = anneescolaire.ID AND seancegenerique.MatiereID = matiere.ID AND seancegenerique.ModuleID = module.ID AND seancegenerique.ProfesseurUtilisateurID = professeur.UtilisateurID AND professeur.UtilisateurID = utilisateur.ID AND professeur.CycleID = cycle.ID AND salle.ID = seancegenerique.SalleID AND  salle.TypeSalleID = typesalle.ID AND salle.BlocID = bloc.ID AND seancegenerique.PeriodeID = periode.ID AND cahiertexte.ID=?";
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			statement.setInt(1, id);
			CahierTexte CahierTexte= new CahierTexte();  
			ResultSet rs=statement.executeQuery();
			
			if(rs.next()) {
//				System.out.println("hola");
			 	
				CahierTexte.setId(rs.getInt("CahierTexteID"));
				CahierTexte.setTexte(rs.getString("cahiertexteTexte"));
				CahierTexte.setObservation(rs.getString("cahiertexteObservation"));
				CahierTexte.setEtat(rs.getString("cahiertexteEtat"));
//				System.out.println(CahierTexte);
// seance
				Seance Seance = new Seance();	
				Seance.setId(rs.getInt("seanceID"));
				Seance.setDate(rs.getDate("seanceDate"));
				Seance.setEtat(rs.getString("seanceEtat"));
				Seance.setObservation(rs.getString("seanceObservation"));
				CahierTexte.setSeance(Seance);
//				System.out.println(Seance);
				AcrivitePedagogique act = new AcrivitePedagogique();
				act.setId(rs.getInt("activiteID"));
				act.setCode(rs.getString("activiteCode"));
				act.setNom_Fr(rs.getString("activiteNomFr"));
				act.setNom_Ar(rs.getString("activiteNomAr"));
				CahierTexte.addActivite(act);
				System.out.println(act);
				SeanceGenerique SeanceGenerique= new SeanceGenerique();
				SeanceGenerique.setId(rs.getInt("seanceSeanceGeneriqueID"));
// class
				Classe Classe=new Classe();
				Classe.setId(rs.getInt("SeanceGeneriqueClasseID"));
//				Classe.setCode(rs.getInt("")); the code is auto generate by the other classes codes....
				Classe.setLabel(rs.getString("classeLabel"));

				ClasseGenerique ClasseGenerique= new ClasseGenerique();
				ClasseGenerique.setId(rs.getInt("classeClasseGeneriqueID"));
				ClasseGenerique.setDescription(rs.getString("classegeneriqueDescription"));
//				System.out.println(ClasseGenerique);
// Niveau
				Niveau Niveau=new Niveau();
				Niveau.setId(rs.getInt("classegeneriqueNiveauID"));
				Niveau.setCode(rs.getString("niveauCode"));
				Niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
				Niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
// Filiere 
				Filiere Filiere= new Filiere();
				Filiere.setId(rs.getInt("classegeneriqueFiliereID"));
				Filiere.setCode(rs.getString("filiereCode"));
				Filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
				Filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
//				System.out.println(Filiere);
//				Filiere Filiere= new Filiere(rs.getInt("classegeneriqueFiliereID"),rs.getString("filiereCode"),
//								rs.getString("filiereNom_Fr"),rs.getString("filiereNom_Ar"));
// Cycle
				Cycle Cycle=new Cycle();
				Cycle.setId(rs.getInt("classegeneriqueCycleID"));
				Cycle.setCode(rs.getString("cycleCode"));
				Cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
				Cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
//				System.out.println(Cycle);
//				Cycle Cycle=new Cycle(rs.getInt("classegeneriqueCycleID"),rs.getString("cycleCode"),
//									rs.getString("cycleNom_Fr"),rs.getString("cycleNom_Ar"));
				
// AnneeScolaire
				AnneeScolaire AnneeScolaire = new AnneeScolaire();
				AnneeScolaire.setId(rs.getInt("classeAnneeScolaireID"));
				AnneeScolaire.setCode(rs.getString("anneescolaireCode"));
				AnneeScolaire.setDateDebut(rs.getDate("anneescolaireDateDebut"));
				AnneeScolaire.setDateFin(rs.getDate("anneescolaireDateFin"));
//				System.out.println(AnneeScolaire);
// Matiere
				Matiere Matiere= new Matiere();
				Matiere.setId(rs.getInt("SeanceGeneriqueMatiereID"));
				Matiere.setCode(rs.getString("matiereCode"));
				Matiere.setNom_Ar(rs.getString("matiereNom_Fr"));
				Matiere.setNom_Fr(rs.getString("matiereNom_Ar"));
//				System.out.println(Matiere);
				
// Module
				Module m=new Module();
				m.setId(rs.getInt("SeanceGeneriqueModuleID"));
				m.setCode(rs.getString("moduleCode"));
				m.setMatiere(Matiere);
				m.setNom_Fr(rs.getString("moduleNom_Fr"));
				m.setNom_Ar(rs.getString("moduleNom_Ar"));
				
				
// Professeur
				Professeur Professeur = new Professeur(
						rs.getInt("SeanceGeneriqueProfesseurUtilisateurID"),
						rs.getString("utilisateurNom_Fr"),
						rs.getString("utilisateurNom_Ar"),
						rs.getString("utilisateurPrenom_Fr"),
						rs.getString("utilisateurPrenom_Ar"),
						rs.getString("utilisateurSexe"),
						rs.getString("utilisateurCin"),
						rs.getString("utilisateurNationalite"),
						rs.getDate("utilisateurDateNais"),
						rs.getString("utilisateurLieuNais_Fr"),
						rs.getString("utilisateurLieuNais_Ar"),
						rs.getString("utilisateurAdresse_Fr"),
						rs.getString("utilisateurAdresse_Ar"),
						rs.getString("utilisateurEmail"),
						rs.getString("utilisateurSituationF"),
						rs.getString("utilisateurTitre"),
						rs.getString("utilisateurTeleMobile"),
						rs.getString("utilisateurTeleDomicile"),
						rs.getString("utilisateurPhoto"),
						new Specialite(),
						new Cycle(rs.getInt("classegeneriqueCycleID"),
						rs.getString("CycleCode"),
						rs.getString("cycleNom_Fr"),
						rs.getString("cycleNom_Ar")) );
//						System.out.println(Professeur);	
				
// Salle
//				Salle Salle=new Salle();
//				Salle.setId(rs.getInt("SeanceGeneriqueClasseID"));
//				Salle.setCode(rs.getString("salleCode"));
//				Salle.setNom_Ar(rs.getString("salleNom_Ar"));
//				Salle.setNom_Fr(rs.getString("salleNom_Fr"));
//				System.out.println(Salle);
//				TypeSalle tsalle=new TypeSalle();
//				tsalle.setId(idclass);
//				System.out.println(tsalle);
				
//				Salle Salle=new Salle(rs.getInt("SeanceGeneriqueSalleID"),rs.getString("salleCode"),
//						rs.getString("salleNom_Fr"),rs.getString("salleNom_Ar"),
//						new TypeSalle(rs.getInt("salleTypeSalleID"),rs.getString("typesalleCode"),
//						rs.getString("typesalleNom_Fr"),rs.getString("typesalleNom_Ar")),
//						new Bloc(rs.getInt("salleBlocID"),rs.getString("blocCode"),rs.getString("blocNom_Fr"),rs.getString("blocNom_Ar")));
//				
				
// Periode
				Periode Periode= new Periode();
				
//				SeanceGenerique.setJour(rs.getString("SeanceGeneriqueJour"));
//				SeanceGenerique.setHeureDebut(rs.getString("SeanceGeneriqueHeureDebut"));
//				SeanceGenerique.setHeureFin(rs.getString("SeanceGeneriqueHeureFin"));
//				SeanceGenerique.setDuree(rs.getShort("seancegeneriqueDuree"));
//				SeanceGenerique.setObservation(rs.getString("SeanceGeneriqueObservation"));
				Seance.setSeanceGenerique(SeanceGenerique);
				SeanceGenerique.setProfesseur(Professeur);
				SeanceGenerique.setPeriode(Periode);
				SeanceGenerique.setClasse(Classe);
				SeanceGenerique.setMatiere(Matiere);
				
				SeanceGenerique.setModule(m);
//				SeanceGenerique.setSalle(Salle);
				Classe.setAnneeScolaire(AnneeScolaire);
				Classe.setClasseGenerique(ClasseGenerique);
				ClasseGenerique.setFiliere(Filiere);
				ClasseGenerique.setNiveau(Niveau);
//Ajouter Le cahierTexte dans la list
			}
			return CahierTexte ;
	
	}

	
	


}
