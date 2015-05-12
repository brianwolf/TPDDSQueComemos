package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

public class UsuarioDiabetico extends UsuarioDecorator {	
	
	
	new(Usuario decorado) 
	{
		super(decorado)
	}
	
	override estadoRutina()
	{		
		// Rutina saludable si tiene una rutina activa o no pesa más de 70 kgs.
		return ((decorado.getPeso() < 70  || decorado.getRutina().rutinaActiva()) 
			&& decorado.estadoRutina())		
	}	
	
	override usuarioValido()
	{
  		return ((decorado.preferenciasAlimenticias.size > 0) && (decorado.sexo != null) && decorado.usuarioValido())  		
	}
	
    
    override cumpleCondicion(Receta receta) 
    {
        return ((receta.cantidadDeAzucar() == 0 ))
    }
}
