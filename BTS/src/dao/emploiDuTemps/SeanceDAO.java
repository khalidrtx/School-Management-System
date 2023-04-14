package dao.emploiDuTemps;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import Domaine.cahierTexte.AcrivitePedagogique;
import Domaine.cahierTexte.CahierTexte;
import Domaine.classe.AnneeScolaire;
import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.classe.Cycle;
import Domaine.classe.Filiere;
import Domaine.classe.Niveau;
import Domaine.emploiDuTemps.Seance;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.matiere.Matiere;
import Domaine.matiere.Module;
import Domaine.matiere.Periode;
import Domaine.personnel.Professeur;
import Domaine.personnel.Specialite;
import dao.database.Db;

public class SeanceDAO {
private Connection con;
	
	public  SeanceDAO() {
		this.con = Db.getInstance().con;
	}
	
	public void insert(Seance Seance) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into Seance (SeanceGeneriqueID,Date,Etat,Observation) values (?, ?, ?, ?)",Statement.RETURN_GENERATED_KEYS);
		statement.setInt(1, Seance.getSeanceGenerique().getId());
		statement.setDate(2, (Date) Seance.getDate());
		statement.setString(3, Seance.getEtat());
		statement.setString(4, Seance.getObservation());
		statement.execute();
		ResultSet rsid= statement.getGeneratedKeys();
		rsid.next();
		int ids = rsid.getInt(1);
		Seance.setId(ids);
		statement.close();	
		
	}
	public void delete(Seance Seance) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("delete from Seance where ID = ?");
			statement.setInt(1, Seance.getId());
			statement.execute();
			statement.close();
		}
	
	public Seance getById(int id) throws SQLException{
		String sql="SELECT\r\n"
				+ "   \r\n"
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
				+ "    cycle.Nom_Fr AS cycleNom_Fr,\r\n"
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
				+ "    utilisateur.TeleDomicile AS utilisateurTeleDomicile,\r\n"
				+ "    professeur.CycleID AS professeurCycleID,\r\n"
				+ "    cycle.Code AS professeurCycleCode,\r\n"
				+ "    cycle.Nom_Fr AS professeurCycleNom\r\n"
				+ "FROM\r\n"
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
				+ "    periode\r\n"
				+ "WHERE\r\n"
				+ "    seance.SeanceGeneriqueID = seancegenerique.ID AND\r\n"
				+ "    seancegenerique.ClasseID = classe.ID AND\r\n"
				+ "    classe.ClasseGeneriqueID = classegenerique.ID AND\r\n"
				+ "    classegenerique.NiveauID = niveau.ID AND\r\n"
				+ "    classegenerique.FiliereID = filiere.ID AND\r\n"
				+ "    classegenerique.CycleID = cycle.ID AND\r\n"
				+ "    classe.AnneeScolaireID = anneescolaire.ID AND\r\n"
				+ "    seancegenerique.MatiereID = matiere.ID AND\r\n"
				+ "    seancegenerique.ModuleID = module.ID AND\r\n"
				+ "    seancegenerique.ProfesseurUtilisateurID = professeur.UtilisateurID AND\r\n"
				+ "    professeur.UtilisateurID = utilisateur.ID AND\r\n"
				+ "    professeur.CycleID = cycle.ID AND\r\n"
				+ "    salle.ID = seancegenerique.SalleID AND\r\n"
				+ "    salle.TypeSalleID = typesalle.ID AND\r\n"
				+ "    salle.BlocID = bloc.ID AND\r\n"
				+ "    seancegenerique.PeriodeID = periode.ID and seance.ID=?;\r\n"
				+ "  \r\n"
				+ "\r\n"
				+ "";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		Seance Seance = new Seance();
		while (rs.next()) {
			Seance.setId(rs.getInt("seanceID"));
			Seance.setDate(rs.getDate("seanceDate"));
			Seance.setEtat(rs.getString("seanceEtat"));
			Seance.setObservation(rs.getString("seanceObservation"));

			SeanceGenerique SeanceGenerique= new SeanceGenerique();
			SeanceGenerique.setId(rs.getInt("seanceSeanceGeneriqueID"));
//class
			Classe Classe=new Classe();
			Classe.setId(rs.getInt("SeanceGeneriqueClasseID"));
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
//			System.out.println(Filiere);
//			Filiere Filiere= new Filiere(rs.getInt("classegeneriqueFiliereID"),rs.getString("filiereCode"),
//							rs.getString("filiereNom_Fr"),rs.getString("filiereNom_Ar"));
//Cycle
			Cycle Cycle=new Cycle();
			Cycle.setId(rs.getInt("classegeneriqueCycleID"));
			Cycle.setCode(rs.getString("cycleCode"));
			Cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
			Cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
//			System.out.println(Cycle);
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
			Module m=new Module();
			m.setId(rs.getInt("SeanceGeneriqueModuleID"));
			m.setCode(rs.getString("moduleCode"));
			m.setMatiere(Matiere);
			m.setNom_Fr(rs.getString("moduleNom_Fr"));
			m.setNom_Ar(rs.getString("moduleNom_Ar"));
			
			
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
			
	
			
			Periode Periode= new Periode();
			

			SeanceGenerique.setProfesseur(Professeur);
			SeanceGenerique.setPeriode(Periode);
			SeanceGenerique.setClasse(Classe);
			SeanceGenerique.setMatiere(Matiere);
			
			Classe.setAnneeScolaire(AnneeScolaire);
			Classe.setClasseGenerique(ClasseGenerique);
			ClasseGenerique.setFiliere(Filiere);
			ClasseGenerique.setNiveau(Niveau);
			SeanceGenerique.setModule(m);
			Seance.setSeanceGenerique(SeanceGenerique);

		}
		rs.close();
		statement.close();
		return Seance;		
	}

	public void update(Seance seance) throws SQLException {
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update seance set  Date = ? , Etat = ?,Observation=? where ID = ?");
		statement.setDate(1, (Date) seance.getDate());
		statement.setString(2, seance.getEtat());
		statement.setString(3, seance.getObservation());
		statement.setInt(4, seance.getId());

		statement.executeUpdate();		
	}

}
