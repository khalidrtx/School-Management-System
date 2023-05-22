package test;

import java.sql.SQLException;
import java.util.ArrayList;

import Domaine.cahierTexte.Inspection;
import Domaine.personnel.Professeur;
import dao.cahierTexte.InspectionDAO;

public abstract class tessssssssssst {

	public static void main(String[] args) throws SQLException {
		ArrayList<Professeur> tab;

		InspectionDAO inspectionDAO = new InspectionDAO();
		tab=inspectionDAO.getAllProfByInsp(12);
		for(Professeur p: tab) {
			System.out.println(p);
		}

	}

}
