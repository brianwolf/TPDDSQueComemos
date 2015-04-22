package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import java.util.Date
import java.util.HashMap
import java.util.ArrayList
import org.junit.Assert

class PrivacidadRecetasTestSuite {
	
	Date fecha = new Date(1970,01,04)
	
	Usuario usuario1 = getUsuario1();
	Usuario usuario2 = getUsuario2();
	
	@Test 
	def Usuario1ModificaRecetaDeUsuario1()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PRIVADA
		Assert.assertTrue(receta.puedeSerModificada(usuario1))			
	}
	
	@Test 
	def Usuario2NoPuedeModificarRecetaDeUsuario1()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PRIVADA
		Assert.assertFalse(receta.puedeSerModificada(usuario2))			
	}
	
	@Test
	def Usuario2ModificaRecetaUsuario1PorSerPublica()
	{
		val receta = getRecetaPure()
		receta.tipo = TipoReceta.PUBLICA
		Assert.assertTrue(receta.puedeSerModificada(usuario2))	
	}
	
	def Usuario getUsuario1()
	{
		new UsuarioPosta(82,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
	}
	
	def Usuario getUsuario2()
	{
		new UsuarioPosta(90,1.62,Rutinas.MEDIANO,"Pablo Lopez",Sexo.MASCULINO,fecha)
	}
	
	def Receta getRecetaPure()
	{		
		val nombre = "Pure"
		val ingredientes = new HashMap<Ingrediente, Integer>()
		ingredientes.put(Ingrediente.PAPA, 1000)
		val condimentos = new HashMap<Condimento, Integer>()
		condimentos.put(Condimento.SAL, 10)
		condimentos.put(Condimento.ACEITE, 10)
		condimentos.put(Condimento.AZUCAR, 100)
		val explicacion = "1 - Pelar las papas\n" + 
						  "2 - Hervir las papas 20 minutos" +
						  "3 - Pisar las papas con un pisapapas" +
						  "4 - Condimentar"
		val temporadas = new ArrayList<Temporada>()		
		temporadas.add(Temporada.INVIERNO)
		temporadas.add(Temporada.OTONIO)
		temporadas.add(Temporada.PRIMAVERA)
		temporadas.add(Temporada.VERANO)						  
		val recetaSimple = new RecetaSimple(usuario1, nombre, ingredientes, condimentos, explicacion, Dificultad.FACIL, temporadas)
		recetaSimple
	}
	
}