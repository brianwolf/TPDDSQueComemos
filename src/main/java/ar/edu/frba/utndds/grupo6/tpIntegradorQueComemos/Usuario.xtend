package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos
import java.util.ArrayList
import java.util.Date
import java.util.HashMap

public interface Usuario {	

	//Métodos
	
	def double calcularIMC()
	
	def void agregarReceta(Receta receta)
	
	def void modificarReceta(String nombreReceta, String nuevo_nombre, HashMap<Ingrediente, Integer> ingredientes,
		HashMap<Condimento, Integer> condimentos, String explicacion, Dificultad dificultad,
		ArrayList<Temporada> temporada)
	
	def Receta getReceta(String nombre)
	
	def void estadoRutina()	
	
	def boolean nombreCorrecto()	
	
	def boolean cumpleCamposObligatorios()
	
	def boolean usuarioValido()
	
	def boolean fechaNacimientoValida()
	
			
	//Getters	
	
	def double getPeso()
	
	def Sexo getSexo()
	
	def double getAltura()
	
	def Rutinas getRutina()

	def ArrayList<Ingrediente> getPreferenciasAlimenticias()
	
	def Recetario getRecetario()
	
	//Setters
	
	def void setPeso(double peso)
	
	def void setAltura(double altura)
	
	def void setSexo(Sexo sexo)
	
	def void setNombre(String nombre)
    
    def void setFechaNacimiento(Date fecha)
    
    def void setPreferenciasAlimenticias (Ingrediente alimento)
    
    def void setPlatosQueNoLeGustan (ArrayList<String> listaDeAlimentos)
    
    def void setRutina(Rutinas rutina)
}
