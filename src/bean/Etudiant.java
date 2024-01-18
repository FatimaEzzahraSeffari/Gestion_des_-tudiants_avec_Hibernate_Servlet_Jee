package bean;

public class Etudiant {
	private int id;
	private String nom;
	private String password1;
	private String email;
	private String tel;
	private String ecole;

	public Etudiant(int id, String nom, String password1, String email, String tel, String ecole) {
		super();
		this.id = id;
		this.nom = nom;
		this.password1 = password1;
		this.email = email;
		this.tel = tel;
		this.ecole = ecole;
	}
	

	public Etudiant() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPassword1() {
		return password1;
	}


	public void setPassword1(String password1) {
		this.password1 = password1;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEcole() {
		return ecole;
	}


	public void setEcole(String ecole) {
		this.ecole = ecole;
	}



}
