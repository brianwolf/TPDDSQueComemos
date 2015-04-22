package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import org.junit.Test
import org.junit.Assert
import java.util.Date

class UsuarioTestSuite {

	Usuario diabetico
	Usuario hipertenso
	Usuario vegano
	Date fecha = new Date(1970,01,04)	

	@Test
	def void unTipoAlto() {
		val pepe = new UsuarioPosta(80.4,1.90,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(22.27, pepe.calcularIMC(), 0.01)
	}

	@Test
	def void testEnunciado() {
		val persona_enunciado = new UsuarioPosta(83,1.88,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(23.48, persona_enunciado.calcularIMC(), 0.01)
	}

	@Test
	def void unTipoGordo() {
		val jesus = new UsuarioPosta(100,1.75,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(32.65, jesus.calcularIMC(), 0.01)
	}

	@Test
	def void homeroSimpson() {
		val homero = new UsuarioPosta(113,1.83,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(33.74, homero.calcularIMC(), 0.01)
	}

	@Test
	def void IMCDeUnUsuarioQueMide100YPesa150() {
		val usuario = new UsuarioPosta(100,1.50,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		Assert.assertEquals(44.44, usuario.calcularIMC(), 0.01)
	}

	@Test
	def void usuarioDiabeticoSaludable() {
		val usuarioDiabeticoSaludable = new UsuarioPosta(82,1.78,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoSaludable )
		diabetico.estadoRutina() 			
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioDiabeticoNoSaludable()
	{
		val usuarioDiabeticoNoSaludable = new UsuarioPosta(82,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoNoSaludable )
		diabetico.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioDiabeticoGordo()
	{
		val usuarioDiabeticoGordo = new UsuarioPosta(100,1.78,Rutinas.INTENSIVO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		diabetico = new UsuarioDiabetico( usuarioDiabeticoGordo )
		diabetico.estadoRutina()
	}
	
	@Test
	def void usuarioHipertensoSaludable()
	{
		val usuarioHipertensoSaludable = new UsuarioPosta(82,1.78,Rutinas.INTENSIVO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoSaludable )
		hipertenso.estadoRutina()	
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioHipertensoNoSaludable()
	{
		val usuarioHipertensoNoSaludable = new UsuarioPosta(82,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoNoSaludable )
		hipertenso.estadoRutina()
	}
	
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioHipertensoGordo()
	{
		val usuarioHipertensoGordo = new UsuarioPosta(100,1.78,Rutinas.ACTIVA_SIN_EJERCICIO,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso( usuarioHipertensoGordo )
		hipertenso.estadoRutina()
	}
	
	// Test Vegano valido con frutas
	@Test
	def void usuarioVeganoSaludable()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(82,1.88,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		vegano.estadoRutina()
	}
	
	// Test Vegano invalido con frutas
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioVeganoNoSaludable()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		vegano.estadoRutina()
	}
	
	// Test Vegano invalido con frutas
	@Test (expected=RutinaNoSaludableExc)
	def void usuarioVeganoGordo()
	{
		val usuarioVeganoNoSaludable = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		vegano = new UsuarioVegano( usuarioVeganoNoSaludable )
		vegano.preferenciasAlimenticias.add(Ingrediente.FRUTA)
		vegano.estadoRutina()
	}
	
	@Test
	def void usuarioVeganoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		vegano = new UsuarioVegano(unUsuario)
		Assert.assertTrue(vegano.usuarioValido())
	}
	
	@Test (expected=UsuarioNoValidoExc)
	def void usuarioVeganoNoValido()
	{
		val usuarioVeganoNoValido = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)		
		usuarioVeganoNoValido.preferenciasAlimenticias.add(Ingrediente.CHORI)
		vegano = new UsuarioVegano(usuarioVeganoNoValido)
		vegano.usuarioValido()
	} 
	
	@Test
	def void usuarioDiabeticoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		diabetico = new UsuarioDiabetico(unUsuario)
		Assert.assertTrue(diabetico.usuarioValido())
	}
	
	@Test (expected=UsuarioNoValidoExc)
	def void usuarioDiabeticoNoValido()
	{
		val usuarioDiabeticoNoValido = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)		
		diabetico = new UsuarioDiabetico(usuarioDiabeticoNoValido)
		diabetico.usuarioValido()
	} 
	
	@Test
	def void usuarioHipertensoValido(){
		val unUsuario = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		unUsuario.preferenciasAlimenticias.add(Ingrediente.PAPA)
		hipertenso = new UsuarioHipertenso(unUsuario)
		Assert.assertTrue(hipertenso.usuarioValido())
	}
	
	@Test (expected=UsuarioNoValidoExc)
	def void usuarioHipertensoNoValido()
	{
		val usuarioHipertensoNoValido = new UsuarioPosta(100,1.78,Rutinas.LEVE,"Juan Jose Lopez",Sexo.MASCULINO,fecha)
		hipertenso = new UsuarioHipertenso(usuarioHipertensoNoValido)
		hipertenso.usuarioValido()
	} 
	
}