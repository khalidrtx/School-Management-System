package dao.classe;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import Domaine.classe.AnneeScolaire;
import Domaine.classe.Classe;
import Domaine.classe.ClasseGenerique;
import Domaine.classe.Cycle;
import Domaine.classe.Filiere;
import Domaine.classe.Niveau;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import dao.database.Db;

public class ClasseDAO {
	private Connection con;
	
	public ClasseDAO() {
		this.con = Db.getInstance().con;
	}
	public void insert(Classe classe) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("insert into classe (ClasseGeneriqueID, AnneeScolaireID, Label) values (?, ?, ?)");
		statement.setInt(1, classe.getClasseGenerique().getId());
		statement.setInt(2, classe.getAnneeScolaire().getId());
		statement.setString(3, classe.getLabel());
		statement.execute();
		statement.close();	
	}
	public ArrayList<Classe> getAll() throws SQLException{
		String query = "SELECT \r\n" + 
		"	`classe`.`ID` AS `classeID`,\r\n" + 
		"	`classe`.`Label` AS `classeLabel`,\r\n" +
		"	`classegenerique`.`ID` AS `classegeneriqueID`,\r\n" + 
		"	`classegenerique`.`Description`,\r\n" + 
		"	`anneescolaire`.`ID` AS `AnneeScolaireID`,\r\n" +
		"	`anneescolaire`.`Code` AS `AnneeScolaireCode`,\r\n" +
		"	`anneescolaire`.`DateDebut` AS `AnneeScolaireDateDebut`,\r\n" +
		"	`anneescolaire`.`DateFin` AS `AnneeScolaireDateFin`,\r\n" +
		"	`cycle`.`ID` AS `cycleID`,\r\n" + 
		"	`cycle`.`Code` AS `cycleCode`,\r\n" + 
		"	`cycle`.`Nom_Fr` AS `cycleNom_Fr`,\r\n" +
		"	`cycle`.`Nom_Ar` AS `cycleNom_Ar`,\r\n" +
		"	`filiere`.`ID` AS `filiereID`,\r\n" + 
		"	`filiere`.`Code` AS `filiereCode`,\r\n" +
		"	`filiere`.`Nom_Fr` AS `filiereNom_Fr`,\r\n" + 
		"	`filiere`.`Nom_Ar` AS `filiereNom_Ar`,\r\n" +
		"	`niveau`.`ID` AS `niveauID`,\r\n" + 
		"	`niveau`.`Code` AS `niveauCode`,\r\n" + 
		"	`niveau`.`Nom_Fr` AS `niveauNom_Fr`,\r\n" + 
		"	`niveau`.`Nom_Ar` AS `niveauNom_Ar`\r\n" +
		"	FROM `classe`, `classegenerique`, `anneescolaire`, `cycle`, `filiere`, `niveau`\r\n" + 
		"	WHERE \r\n" + 
		"	(`classe`.`ClasseGeneriqueID`= `classegenerique`.`ID`) AND\r\n" +
		"	(`classe`.`AnneeScolaireID`= `anneescolaire`.`ID`) AND\r\n" +
		"	(`classegenerique`.`CycleID`= `cycle`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`FiliereID`= `filiere`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`NiveauID`= `niveau`.`ID`)\r\n" + 
		"	;\r\n";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = statement.executeQuery();
		ArrayList<Classe> classes = new ArrayList<Classe>();
		
		while (rs.next()) {
			
			
			Cycle cycle= new Cycle();
			cycle.setId(rs.getInt("cycleID"));
			cycle.setCode(rs.getString("cycleCode"));
			cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
			cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
			
			Filiere filiere = new Filiere();
			filiere.setId(rs.getInt("filiereID"));
			filiere.setCode(rs.getString("filiereCode"));
			filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
			filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
			
			Niveau niveau= new Niveau();
			niveau.setId(rs.getInt("niveauID"));
			niveau.setCode(rs.getString("niveauCode"));
			niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
			niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
			
			ClasseGenerique classeGenerique =new ClasseGenerique();
			classeGenerique.setCycle(cycle);
			classeGenerique.setFiliere(filiere);
			classeGenerique.setNiveau(niveau);
			classeGenerique.setId(rs.getInt("classegeneriqueID"));
			classeGenerique.setDescription(rs.getString("Description"));
			classeGenerique.setCode();
			
			AnneeScolaire anneeScolaire = new AnneeScolaire();
			anneeScolaire.setId(rs.getInt("AnneeScolaireID"));
			anneeScolaire.setCode(rs.getString("AnneeScolaireCode"));
			anneeScolaire.setDateDebut(rs.getDate("AnneeScolaireDateDebut"));
			anneeScolaire.setDateFin(rs.getDate("AnneeScolaireDateFin"));
			
			Classe classe = new  Classe();
			classe.setId(rs.getInt("classeID"));
			classe.setLabel(rs.getString("classeLabel"));
			classe.setClasseGenerique(classeGenerique);
			classe.setAnneeScolaire(anneeScolaire);
			classe.setCode();
			classes.add(classe);
		}
		rs.close();
		statement.close();
		return classes;
				
	}
	public ArrayList<Classe> getAllclassbyprof(int userID) throws SQLException{
		String query="SELECT DISTINCT\r\n"
				+ "    `utilisateur`.`ID`,\r\n"
				+ "    `professeur`.`UtilisateurID`,\r\n"
				+ "    `seancegenerique`.`ProfesseurUtilisateurID`,\r\n"
				+ "    `seancegenerique`.`ClasseID`,\r\n"
				+ "    `classe`.`ID`,\r\n"
				+ "    `classe`.`Label` as 'classeLabel',\r\n"

				+ "    `classe`.`ClasseGeneriqueID`,\r\n"
				+ "    `classegenerique`.`ID`,\r\n"
				+ "    `classegenerique`.`NiveauID` AS niveauID,\r\n"
				+ "    `classegenerique`.`FiliereID` AS filiereID,\r\n"
				+ "    `classegenerique`.`CycleID` AS cycleID,\r\n"
				+ "    `niveau`.`ID`,\r\n"
				+ "    `filiere`.`ID`,\r\n"
				+ "    `cycle`.`ID`,\r\n"
				+ "    `classe`.`AnneeScolaireID`,\r\n"
				+ "    `anneescolaire`.`ID` As 'anneescolaireID',\r\n"
				+ "    `anneescolaire`.`DateDebut` as 'anneescolaireDateDebut',\r\n"
				+ "    `anneescolaire`.`DateFin` as 'anneescolaireDateFin' ,\r\n"
				+ "    `anneescolaire`.`Code` as 'anneescolaireCode' ,\r\n"
				+ "     `classegenerique`.`Description`,\r\n"
				+ "    `filiere`.`Code` AS filiereCode,\r\n"
				+ "    `cycle`.`Code` AS cycleCode,\r\n"
				+ "    `niveau`.`Code` AS niveauCode\r\n"
				+ "\r\n"
				+ "FROM\r\n"
				+ "    `utilisateur`\r\n"
				+ "INNER JOIN `professeur` ON `professeur`.`UtilisateurID` = `utilisateur`.`ID`\r\n"
				+ "INNER JOIN `seancegenerique` ON `seancegenerique`.`ProfesseurUtilisateurID` = `professeur`.`UtilisateurID`\r\n"
				+ "INNER JOIN `classe` ON `seancegenerique`.`ClasseID` = `classe`.`ID`\r\n"
				+ "INNER JOIN `classegenerique` ON `classe`.`ClasseGeneriqueID` = `classegenerique`.`ID`\r\n"
				+ "INNER JOIN `niveau` ON `classegenerique`.`NiveauID` = `niveau`.`ID`\r\n"
				+ "INNER JOIN `filiere` ON `classegenerique`.`FiliereID` = `filiere`.`ID`\r\n"
				+ "INNER JOIN `cycle` ON `classegenerique`.`CycleID` = `cycle`.`ID`\r\n"
				+ "INNER JOIN `anneescolaire` ON `classe`.`AnneeScolaireID` = `anneescolaire`.`ID`\r\n"
				+ "INNER JOIN  `anneescolairecourante` on `anneescolairecourante`.`AnneeScolaireID`=`anneescolaire`.`ID`\r\n"
				+ " where `professeur`.`UtilisateurID` = ? ;\r\n"
				+ "";
	
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, userID);
		ResultSet rs = statement.executeQuery();
		ArrayList<Classe> Classes = new ArrayList<Classe>();
		
		while (rs.next()) {
			
			ClasseGenerique classeGenerique =new ClasseGenerique();
			Cycle cycle= new Cycle();
			cycle.setId(rs.getInt("cycleID"));
			cycle.setCode(rs.getString("cycleCode"));
			cycle.setNom_Fr(null);
			cycle.setNom_Ar(null);
			
			Filiere filiere = new Filiere();
			filiere.setId(rs.getInt("filiereID"));
			filiere.setCode(rs.getString("filiereCode"));
			filiere.setNom_Fr(null);
			filiere.setNom_Ar(null);
			
			Niveau niveau= new Niveau();
			niveau.setId(rs.getInt("niveauID"));
			niveau.setCode(rs.getString("niveauCode"));
			niveau.setNom_Fr(null);
			niveau.setNom_Ar(null);
			
			classeGenerique.setCycle(cycle);
			classeGenerique.setFiliere(filiere);
			classeGenerique.setNiveau(niveau);
			
			classeGenerique.setId(rs.getInt("classegeneriqueID"));
			classeGenerique.setDescription(rs.getString("Description"));
			classeGenerique.setCode();
			
			Classe classe=new Classe();
			AnneeScolaire anneescolaire=new AnneeScolaire();
			anneescolaire.setId(rs.getInt("anneescolaireID"));
			anneescolaire.setDateDebut(rs.getDate("anneescolaireDateDebut"));
			anneescolaire.setDateDebut(rs.getDate("anneescolaireDateFin"));
			anneescolaire.setCode(rs.getString("anneescolaireCode"));
			
			classe.setClasseGenerique(classeGenerique);
			classe.setAnneeScolaire(anneescolaire);
			
			classe.setId(rs.getInt("ClasseID"));
			classe.setLabel(rs.getString("classeLabel"));
			classe.setCode();
			Classes.add(classe);
		}
		rs.close();
		statement.close();
		return Classes;
	}
	
	public Classe getById(int id) throws SQLException{
		String query = "SELECT \r\n" + 
		"	`classe`.`ID` AS `classeID`,\r\n" + 
		"	`classe`.`Label` AS `classeLabel`,\r\n" +
		"	`classegenerique`.`ID` AS `classegeneriqueID`,\r\n" + 
		"	`classegenerique`.`Description`,\r\n" + 
		"	`anneescolaire`.`ID` AS `AnneeScolaireID`,\r\n" +
		"	`anneescolaire`.`Code` AS `AnneeScolaireCode`,\r\n" +
		"	`anneescolaire`.`DateDebut` AS `AnneeScolaireDateDebut`,\r\n" +
		"	`anneescolaire`.`DateFin` AS `AnneeScolaireDateFin`,\r\n" +
		"	`cycle`.`ID` AS `cycleID`,\r\n" + 
		"	`cycle`.`Code` AS `cycleCode`,\r\n" + 
		"	`cycle`.`Nom_Fr` AS `cycleNom_Fr`,\r\n" +
		"	`cycle`.`Nom_Ar` AS `cycleNom_Ar`,\r\n" +
		"	`filiere`.`ID` AS `filiereID`,\r\n" + 
		"	`filiere`.`Code` AS `filiereCode`,\r\n" +
		"	`filiere`.`Nom_Fr` AS `filiereNom_Fr`,\r\n" + 
		"	`filiere`.`Nom_Ar` AS `filiereNom_Ar`,\r\n" +
		"	`niveau`.`ID` AS `niveauID`,\r\n" + 
		"	`niveau`.`Code` AS `niveauCode`,\r\n" + 
		"	`niveau`.`Nom_Fr` AS `niveauNom_Fr`,\r\n" + 
		"	`niveau`.`Nom_Ar` AS `niveauNom_Ar`\r\n" +
		"	FROM `classe`, `classegenerique`, `anneescolaire`, `cycle`, `filiere`, `niveau`\r\n" + 
		"	WHERE \r\n" + 
		"	(`classe`.`ClasseGeneriqueID`= `classegenerique`.`ID`) AND\r\n" +
		"	(`classe`.`AnneeScolaireID`= `anneescolaire`.`ID`) AND\r\n" +
		"	(`classegenerique`.`CycleID`= `cycle`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`FiliereID`= `filiere`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`NiveauID`= `niveau`.`ID`) AND\r\n" + 
		"	(`classe`.`ID`= ? );\r\n";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		Classe classe = new Classe();
		
		while (rs.next()) {
			
			Cycle cycle= new Cycle();
			cycle.setId(rs.getInt("cycleID"));
			cycle.setCode(rs.getString("cycleCode"));
			cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
			cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
			
			Filiere filiere = new Filiere();
			filiere.setId(rs.getInt("filiereID"));
			filiere.setCode(rs.getString("filiereCode"));
			filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
			filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
			
			Niveau niveau= new Niveau();
			niveau.setId(rs.getInt("niveauID"));
			niveau.setCode(rs.getString("niveauCode"));
			niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
			niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
			
			ClasseGenerique classeGenerique =new ClasseGenerique();
			classeGenerique.setCycle(cycle);
			classeGenerique.setFiliere(filiere);
			classeGenerique.setNiveau(niveau);
			classeGenerique.setId(rs.getInt("classegeneriqueID"));
			classeGenerique.setDescription(rs.getString("Description"));
			classeGenerique.setCode();
			
			AnneeScolaire anneeScolaire = new AnneeScolaire();
			anneeScolaire.setId(rs.getInt("AnneeScolaireID"));
			anneeScolaire.setCode(rs.getString("AnneeScolaireCode"));
			anneeScolaire.setDateDebut(rs.getDate("AnneeScolaireDateDebut"));
			anneeScolaire.setDateFin(rs.getDate("AnneeScolaireDateFin"));
			
			
			classe.setId(rs.getInt("classeID"));
			classe.setLabel(rs.getString("classeLabel"));
			classe.setClasseGenerique(classeGenerique);
			classe.setAnneeScolaire(anneeScolaire);
			classe.setCode();
			
		}
		rs.close();
		statement.close();
		return classe;
	}
	
	public void update(Classe classe) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("update classe set ClasseGeneriqueID = ? , AnneeScolaireID = ? , Label = ? where ID = ?");
		statement.setInt(1, classe.getClasseGenerique().getId());
		statement.setInt(2, classe.getAnneeScolaire().getId());
		statement.setString(3, classe.getLabel());
		statement.setInt(4, classe.getId());
		statement.execute();
		statement.close();	
	}
	
	public void delete(Classe classe) throws SQLException{
		PreparedStatement statement = (PreparedStatement) con.prepareStatement("delete from classe where ID = ?");
		statement.setInt(1, classe.getId());
		statement.execute();
		statement.close();
	}
	public Classe exists(Classe classeToFind) throws SQLException{
		String query = "SELECT \r\n" + 
		"	`classe`.`ID` AS `classeID`,\r\n" + 
		"	`classe`.`Label` AS `classeLabel`,\r\n" +
		"	`classegenerique`.`ID` AS `classegeneriqueID`,\r\n" + 
		"	`classegenerique`.`Description`,\r\n" + 
		"	`anneescolaire`.`ID` AS `AnneeScolaireID`,\r\n" +
		"	`anneescolaire`.`Code` AS `AnneeScolaireCode`,\r\n" +
		"	`anneescolaire`.`DateDebut` AS `AnneeScolaireDateDebut`,\r\n" +
		"	`anneescolaire`.`DateFin` AS `AnneeScolaireDateFin`,\r\n" +
		"	`cycle`.`ID` AS `cycleID`,\r\n" + 
		"	`cycle`.`Code` AS `cycleCode`,\r\n" + 
		"	`cycle`.`Nom_Fr` AS `cycleNom_Fr`,\r\n" +
		"	`cycle`.`Nom_Ar` AS `cycleNom_Ar`,\r\n" +
		"	`filiere`.`ID` AS `filiereID`,\r\n" + 
		"	`filiere`.`Code` AS `filiereCode`,\r\n" +
		"	`filiere`.`Nom_Fr` AS `filiereNom_Fr`,\r\n" + 
		"	`filiere`.`Nom_Ar` AS `filiereNom_Ar`,\r\n" +
		"	`niveau`.`ID` AS `niveauID`,\r\n" + 
		"	`niveau`.`Code` AS `niveauCode`,\r\n" + 
		"	`niveau`.`Nom_Fr` AS `niveauNom_Fr`,\r\n" + 
		"	`niveau`.`Nom_Ar` AS `niveauNom_Ar`\r\n" +
		"	FROM `classe`, `classegenerique`, `anneescolaire`, `cycle`, `filiere`, `niveau`\r\n" + 
		"	WHERE \r\n" + 
		"	(`classe`.`ClasseGeneriqueID`= `classegenerique`.`ID`) AND\r\n" +
		"	(`classe`.`AnneeScolaireID`= `anneescolaire`.`ID`) AND\r\n" +
		"	(`classegenerique`.`CycleID`= `cycle`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`FiliereID`= `filiere`.`ID`) AND\r\n" + 
		"	(`classegenerique`.`NiveauID`= `niveau`.`ID`) AND\r\n" + 
		"	(`classe`.`ClasseGeneriqueID`= ? ) AND\r\n" +
		"	(`classe`.`AnneeScolaireID`= ? ) AND\r\n" +
		"	(`classe`.`Label`= ? );";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		statement.setInt(1, classeToFind.getClasseGenerique().getId());
		statement.setInt(2, classeToFind.getAnneeScolaire().getId());
		statement.setString(3, classeToFind.getLabel());
		ResultSet rs = statement.executeQuery();
		Classe classe = new Classe();
		
		while (rs.next()) {
			Cycle cycle= new Cycle();
			cycle.setId(rs.getInt("cycleID"));
			cycle.setCode(rs.getString("cycleCode"));
			cycle.setNom_Fr(rs.getString("cycleNom_Fr"));
			cycle.setNom_Ar(rs.getString("cycleNom_Ar"));
			
			Filiere filiere = new Filiere();
			filiere.setId(rs.getInt("filiereID"));
			filiere.setCode(rs.getString("filiereCode"));
			filiere.setNom_Fr(rs.getString("filiereNom_Fr"));
			filiere.setNom_Ar(rs.getString("filiereNom_Ar"));
			
			Niveau niveau= new Niveau();
			niveau.setId(rs.getInt("niveauID"));
			niveau.setCode(rs.getString("niveauCode"));
			niveau.setNom_Fr(rs.getString("niveauNom_Fr"));
			niveau.setNom_Ar(rs.getString("niveauNom_Ar"));
			
			ClasseGenerique classeGenerique =new ClasseGenerique();
			classeGenerique.setCycle(cycle);
			classeGenerique.setFiliere(filiere);
			classeGenerique.setNiveau(niveau);
			classeGenerique.setCode();
			classeGenerique.setId(rs.getInt("classegeneriqueID"));
			classeGenerique.setDescription(rs.getString("Description"));
			
			
			AnneeScolaire anneeScolaire = new AnneeScolaire();
			anneeScolaire.setId(rs.getInt("AnneeScolaireID"));
			anneeScolaire.setCode(rs.getString("AnneeScolaireCode"));
			anneeScolaire.setDateDebut(rs.getDate("AnneeScolaireDateDebut"));
			anneeScolaire.setDateFin(rs.getDate("AnneeScolaireDateFin"));
			
			classe.setId(rs.getInt("classeID"));
			classe.setLabel(rs.getString("classeLabel"));
			classe.setClasseGenerique(classeGenerique);
			classe.setAnneeScolaire(anneeScolaire);
			classe.setCode();
		}
		rs.close();
		statement.close();
		if(classe.getId()==0){
			return null;
		}else{
			
		}
		return classe;
				
	}
}
