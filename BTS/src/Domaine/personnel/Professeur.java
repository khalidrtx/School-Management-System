package Domaine.personnel;

import java.util.ArrayList;
import java.util.Date;

import Domaine.personnel.AbsenceProfesseur;
import Domaine.classe.Cycle;

public class Professeur extends Personnel {
	private Specialite specialite;
	private Cycle cycle;
	
	public Professeur() {
		super();
	}
	public Professeur(Specialite specialite,Cycle cycle) {
		super();
		// TODO Auto-generated constructor stub
		this.specialite = specialite;
		this.cycle = cycle;
	}
	public Professeur(int id, String nom_Fr, String nom_Ar, String prenom_Fr,
			String prenom_Ar, String sexe, String cin, String nationalite,
			Date dateNais, String lieuNais_Fr, String lieuNais_Ar,
			String adresse_Fr, String adresse_Ar, String email,
			String situationF, String titre, String teleMobile,
			String teleDomicile, String photo, Specialite specialite,Cycle cycle ) {
		super(id, nom_Fr, nom_Ar, prenom_Fr, prenom_Ar, sexe, cin, nationalite,
				dateNais, lieuNais_Fr, lieuNais_Ar, adresse_Fr, adresse_Ar, email,
				situationF, titre, teleMobile, teleDomicile, photo);
		// TODO Auto-generated constructor stub
		this.specialite = specialite;
		this.cycle = cycle;
	}

	
	public Specialite getSpecialite() {
		return specialite;
	}
	public void setSpecialite(Specialite specialite) {
		this.specialite = specialite;
	}
	public Cycle getCycle() {
		return cycle;
	}
	public void setCycle(Cycle cycle) {
		this.cycle = cycle;
	}
	@Override
	public String toString() {
		return "Professeur [absences=" + absences + ", specialite="
				+ specialite + ", cycle=" + cycle + ", som=" + som
				+ ", dateEmbauche=" + dateEmbauche + ", dateAffectation="
				+ dateAffectation + ", nbrEnfants=" + nbrEnfants + ", etat="
				+ etat + ", somConjoint=" + somConjoint + ", numContrat="
				+ numContrat + ", fonctions=" + fonctions + ", diplomes="
				+ diplomes + ", notes=" + notes + ", situationAdministrative="
				+ situationAdministrative + ", cadre=" + cadre
				+ ", fonctionActuelle=" + fonctionActuelle + ", avancements="
				+ avancements + ", id=" + id + ", nom_Fr=" + nom_Fr
				+ ", nom_Ar=" + nom_Ar + ", prenom_Fr=" + prenom_Fr
				+ ", prenom_Ar=" + prenom_Ar + ", sexe=" + sexe + ", cin="
				+ cin + ", nationalite=" + nationalite + ", dateNais="
				+ dateNais + ", lieuNais_Fr=" + lieuNais_Fr + ", lieuNais_Ar="
				+ lieuNais_Ar + ", adresse_Fr=" + adresse_Fr + ", adresse_Ar="
				+ adresse_Ar + ", email=" + email + ", situationF="
				+ situationF + ", titre=" + titre + ", teleMobile="
				+ teleMobile + ", teleDomicile=" + teleDomicile + ", contacts="
				+ contacts + ", comptes=" + comptes + ", photo=" + photo + "]";
	}
}