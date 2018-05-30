package dev.paie.entite;

import java.util.List;

public class Collegues {

	private String matricule;
	private String nom;
	private String prenom;
	private String email;
	private String dateNaissance;
	private String sex;
	private String adresse;
	private String password;
	private String photo;
	private List<String> subalternes;
	private String departement;

	public Collegues() {
	}

	public Collegues(String matricule, String nom, String prenom, String email, String dateNaissance, String sex,
			String adresse, String password, String photo, List<String> subalternes, String departement) {
		super();
		this.matricule = matricule;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.dateNaissance = dateNaissance;
		this.sex = sex;
		this.adresse = adresse;
		this.password = password;
		this.photo = photo;
		this.subalternes = subalternes;
		this.departement = departement;
	}

	public String getMatricule() {
		return matricule;
	}

	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(String dateNaissance) {
		this.dateNaissance = dateNaissance;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public List<String> getSubalternes() {
		return subalternes;
	}

	public void setSubalternes(List<String> subalternes) {
		this.subalternes = subalternes;
	}

	public String getDepartement() {
		return departement;
	}

	public void setDepartement(String departement) {
		this.departement = departement;
	}

}
