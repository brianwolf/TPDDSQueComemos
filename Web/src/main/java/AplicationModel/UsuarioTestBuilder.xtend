package AplicationModel

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Rutina
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.UsuarioPosta
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConAzucar
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaValida
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConSal
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.FactoryTestReceta.recetaConCarne
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsuarioTestBuilder {
	
	
	recetaValida recetaEsValida = new recetaValida()
	recetaConAzucar recetaAzucar = new recetaConAzucar()
	recetaConSal recetaSal = new recetaConSal()
	recetaConCarne recetaCarne = new recetaConCarne()
	
	def UsuarioPosta usuarioBuilder( String nombre ){
		if ( nombre == "Lucas" ) return new UsuarioPosta(80.4, 1.90, Rutina.ACTIVA_SIN_EJERCICIO, nombre , Sexo.MASCULINO)
		else if ( nombre == "Mariano" ) return new UsuarioPosta(210.4, 1.40, Rutina.INTENSIVO, nombre , Sexo.MASCULINO) 
	} 
	
}