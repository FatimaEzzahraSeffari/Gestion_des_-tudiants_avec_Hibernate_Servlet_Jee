package bean;

public class Module {
	private int id;
	private String nom;
	private String Description;
	public Module(int id, String nom,String Description) {
		super();
		this.id = id;
		this.nom = nom;
		this.Description = Description;
	}
	
	public Module() {
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
	public String getDescription() {
		return Description;
	}


	public void setDescription(String Description) {
		this.Description = Description;
	}
}

