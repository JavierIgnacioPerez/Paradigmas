public class UserModel{
    
    // Atributos.

	// String que contendra el nombre del usuario.
	String name;
        // String que contiene la preferencia de marca del usuario.
        String brandPreference;
        // String que contiene la preferencia de modelo del usuario.
        String modelPreference;
        // Integer que contrendra la valorizacion del usuario.
        int userRate;
        
    // Metodos.
        
        // Metodo que construye el objeto User.
	// Entrada : String con el nombre del Usuario, String con la marca preferida y String con el modelo preferido.
	// Salida : Objeto User.
	public UserModel(String str){
		setName(str);
	}
        
        // Get

        // Metodo que realiza el get al rate del usuario.
	// Entrada : Vacia.
	// Salida :  Integer con el rate del usurio.
	public int getUserRate(){
		return this.userRate;
	}
        
	// Metodo que realiza el get al nombre del usuario.
	// Entrada : Vacia
	// Salida : String con el nombre de usuario.
	public String getName(){
		return this.name;
        }
        
        // Metodo que realiza el get a la preferencia de marca del usuario.
	// Entrada : Vacia
	// Salida : String con la prefrerencia de marca del usuario.
	public String getBrandPreference(){
		return this.brandPreference;
        }
        
        // Metodo que realiza el get a la preferencia de modelo del usuario.
	// Entrada : Vacia
	// Salida : String con la prefrerencia de modelo del usuario.
	public String getModelPreference(){
		return this.modelPreference;
        }

	// Set

        // Metodo que realiza el set al rate del usuario.
	// Entrada : Integer con el rate del usurio.
	// Salida : Vacio.
	public void setUserRate(int num){
		this.userRate = num;
	}
        
	// Metodo que realiza el set al nombre del usuario.
	// Entrada : String con el nombre del usurio.
	// Salida : Vacio.
	public void setName(String str){
		this.name = str;
	}
        
        // Metodo que realiza el set a la preferencia de marca del usuario.
	// Entrada : String con la marca de preferencia del usurio.
	// Salida : Vacio.
	public void setBrandPreference(String str){
		this.brandPreference = str;
	}
        
        // Metodo que realiza el set a la preferencia de modelo del usuario.
	// Entrada : String con la modelo de preferencia del usuario.
	// Salida : Vacio.
	public void setModelPreference(String str){
		this.modelPreference = str;
	}
}
