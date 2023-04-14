package dao.emploiDuTemps;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Domaine.matiere.Matiere;
import Domaine.matiere.Module;

import Domaine.classe.Classe;


import Domaine.classe.Filiere;
import Domaine.classe.Niveau;
import Domaine.emploiDuTemps.SeanceGenerique;
import Domaine.locaux.Salle;
import Domaine.matiere.Periode;
import Domaine.personnel.Professeur;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import dao.database.Db;
public class SeanceGeneriqueDAO {
private Connection con;
	
	public  SeanceGeneriqueDAO() {
		this.con = Db.getInstance().con;
	}
	public void insert(SeanceGenerique sg) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into seancegenerique (ClasseID, MatiereID, ModuleID,ProfesseurUtilisateurID, ,PeriodeID,Jour,HeureDebut,HeureFin,Duree,Observation) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		statement.setInt(1, sg.getClasse().getId());
		statement.setInt(2, sg.getMatiere().getId());
		statement.setInt(3, sg.getModule().getId());
		statement.setInt(4, sg.getProfesseur().getId());
		statement.setInt(5, sg.getSalle().getId());
		statement.setInt(6, sg.getPeriode() .getId());
		statement.setString(7, sg.getJour());
		statement.setString(8, sg.getHeureDebut());
		statement.setString(9, sg.getHeureFin());
		statement.setInt(10, sg.getDuree());
		statement.setString(11, sg.getObservation());
		statement.execute();
		statement.close();	
	}
	
	
	public ArrayList<SeanceGenerique> getSeanceGeneriqurByProfnClass(int idClass , int idUser) throws SQLException{
		String query = "SELECT \r\n"
				+ "    seancegenerique.ID as seancegeneriqueID ,\r\n"
				+ "    seancegenerique.ClasseID as ClasseID,\r\n"
				+ "    seancegenerique.ProfesseurUtilisateurID as ProfesseurUtilisateurID,\r\n"
				+ "    seancegenerique.Jour as Jour ,\r\n"
				+ "    seancegenerique.HeureDebut as HeureDebut ,\r\n"
				+ "    seancegenerique.HeureFin as HeureFin,\r\n"
				+ "    seancegenerique.ModuleID as ModuleID,\r\n"
				+ "    seancegenerique.MatiereID as seancegeneriqueMatiereID ,\r\n"
				+ "    seancegenerique.SalleID as seancegeneriqueSalleID,\r\n"
				+ "    seancegenerique.Duree as seancegeneriqueDuree,\r\n"
				+ "    module.Nom_Fr as moduleNom_Fr,\r\n"
				+ "    module.Nom_Ar as moduleNom_Ar,\r\n"
				+ "    matiere.Nom_Fr as matiereNom_Fr,\r\n"
				+ "    matiere.Nom_Ar as matiereNom_Ar,\r\n"
				+ "    matiere.Code as matiereCode,\r\n"				
				+ "    salle.Nom_Fr as salleNom_Fr,\r\n"
				+ "    salle.Nom_Ar as salleNom_Ar,\r\n"
				+ "    professeur.CycleID AS Cycle,\r\n"
				+ "    professeur.SpecialiteID AS Specialite,\r\n"
				+ "    utilisateur.Photo AS Photo,\r\n"
				+ "    utilisateur.Nom_Fr AS Nom_fr,\r\n"
				+ "    utilisateur.Nom_Ar AS Nom_Ar,\r\n"
				+ "    utilisateur.Prenom_Fr AS Prenom_Fr,\r\n"
				+ "    utilisateur.Prenom_Ar AS Prenom_Ar,\r\n"
				+ "    utilisateur.Sexe AS Sexe,\r\n"
				+ "    utilisateur.Titre AS Titre,\r\n"
				+ "    utilisateur.Cin AS Cin,\r\n"
				+ "    utilisateur.Nationalite AS Nationalite,\r\n"
				+ "    utilisateur.DateNais AS DateNais,\r\n"
				+ "    utilisateur.LieuNais_Fr AS LieuNais_Fr,\r\n"
				+ "    utilisateur.LieuNais_Ar AS LieuNais_Ar,\r\n"
				+ "    utilisateur.Adresse_Fr AS Adresse_Fr,\r\n"
				+ "    utilisateur.Adresse_Ar AS Adresse_Ar,\r\n"
				+ "    utilisateur.Email AS Email,\r\n"
				+ "    utilisateur.SituationF AS SituationF,\r\n"
				+ "    utilisateur.TeleMobile AS TeleMobile,\r\n"
				+ "    utilisateur.TeleDomicile AS TeleDomicile\r\n"
				+ "FROM\r\n"
				+ "    seancegenerique\r\n"
				+ "INNER JOIN module ON seancegenerique.ModuleID = module.ID\r\n"
				+ "INNER JOIN professeur ON seancegenerique.ProfesseurUtilisateurID = professeur.utilisateurID \r\n"
				+ "INNER JOIN utilisateur ON utilisateur.ID = professeur.utilisateurID \r\n"
				+ "INNER JOIN matiere ON seancegenerique.MatiereID = matiere.ID\r\n"
				+ "INNER JOIN salle ON seancegenerique.SalleID = salle.ID \r\n"
				+ "WHERE \r\n"
				+ "    ProfesseurUtilisateurID=? AND\r\n"
				+ "    ClasseID=?;\r\n"
				+ "";
		//`seancegenerique`.`ID` not in (select `SeanceGeneriqueID` from `seance` )
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, idUser);
		statement.setInt(2,idClass );
		ResultSet rs = statement.executeQuery();
		ArrayList<SeanceGenerique> tab = new ArrayList<SeanceGenerique>();

		while (rs.next()) {
			Salle salle=new Salle();
			salle.setId(rs.getInt("seancegeneriqueSalleID"));
			salle.setNom_Fr(rs.getString("salleNom_Fr"));
			salle.setNom_Ar(rs.getString("salleNom_Ar"));
			
			Matiere matiere =new Matiere();
			matiere.setId(rs.getInt("seancegeneriqueMatiereID"));
			matiere.setCode(rs.getString("matiereCode"));
			matiere.setNom_Fr(rs.getString("matiereNom_Fr"));
			matiere.setNom_Ar(rs.getString("matiereNom_Ar"));
			
				
			Professeur p=new Professeur();
			p.setId(rs.getInt("ProfesseurUtilisateurID"));
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
				
			
			Classe classe = new Classe();
			classe.setId(rs.getInt("ClasseID"));
			
			Module module = new Module();
			module.setId(rs.getInt("ModuleID"));
			module.setNom_Fr(rs.getString("moduleNom_Fr"));
			module.setNom_Ar(rs.getString("moduleNom_Ar"));
			module.setMatiere(matiere);
			
			SeanceGenerique seg =new SeanceGenerique();
			
			seg.setId(rs.getInt("seancegeneriqueID"));
			seg.setJour(rs.getString("Jour"));
			seg.setHeureFin(rs.getString("HeureFin"));
			seg.setHeureDebut(rs.getString("HeureDebut"));
			seg.setDuree(rs.getInt("seancegeneriqueDuree"));
			seg.setProfesseur(p);
			seg.setMatiere(matiere);
			seg.setSalle(salle);
			seg.setModule(module);
			seg.setClasse(classe);
			
			tab.add(seg);
			}
		rs.close();
		statement.close();
		return tab;
	}
	public  ArrayList<SeanceGenerique> getMatiereModulebyseancegen(int seancegen) throws SQLException{
		String sql="SELECT\r\n"
				+ "    `seancegenerique`.`ID` AS 'seancegeneriqueID',\r\n"
				+ "    `seancegenerique`.`MatiereID` AS 'MatiereID',\r\n"
				+ "    `matiere`.`Code` AS 'matiereCode',\r\n"
				+ "    `matiere`.`Nom_Fr` AS 'matiereNom_Fr',\r\n"
				+ "    `seancegenerique`.`ModuleID` AS 'ModuleID',\r\n"
				+ "    `module`.`Code` AS 'moduleCode',\r\n"
				+ "    `module`.`Nom_Fr` AS 'moduleNom_Fr'\r\n"
				+ "FROM\r\n"
				+ "    `seancegenerique`\r\n"
				+ "INNER JOIN `matiere` ON `seancegenerique`.`MatiereID` = `matiere`.`ID`\r\n"
				+ "INNER JOIN `module` ON `seancegenerique`.`ModuleID` = `module`.`ID`\r\n"
				+ "WHERE\r\n"
				+ "    `seancegenerique`.`ID` = ?;";
		
			ArrayList<SeanceGenerique> tab = new ArrayList<SeanceGenerique>();
			PreparedStatement statement = (PreparedStatement) con.prepareStatement(sql);
			statement.setInt(1, seancegen);		
			ResultSet rs = statement.executeQuery();
			SeanceGenerique sq = null;
			while(rs.next()) {
				sq=new SeanceGenerique();
				sq.setId(rs.getInt("seancegeneriqueID"));
				
				Matiere Matiere= new Matiere();
				Matiere.setId(rs.getInt("MatiereID"));
				Matiere.setCode(rs.getString("matiereCode"));
				Matiere.setNom_Fr(rs.getString("matiereNom_Fr"));
				
				Module  Module= new Module();
				Module.setId(rs.getInt("ModuleID"));
				Module.setCode(rs.getString("moduleCode"));
				Module.setNom_Fr(rs.getString("moduleNom_Fr"));
				
				sq.setMatiere(Matiere);
				sq.setModule(Module);
				
				
				tab.add(sq);				
			}
			rs.close();
			statement.close();
			return tab;
		
	}
	
	
}

