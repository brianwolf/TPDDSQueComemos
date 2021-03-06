package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums.Sexo
import java.util.Map
import java.util.HashMap
import javax.persistence.Entity
import org.hibernate.annotations.CollectionOfElements
import org.hibernate.annotations.Fetch
import org.hibernate.annotations.FetchMode
import javax.persistence.FetchType

@Entity
class ConsultasXSexo extends Observador {

	@CollectionOfElements ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT)
	private Map<String, Integer> consultasXFemenino = new HashMap<String, Integer>
	
	@CollectionOfElements ( fetch = FetchType.EAGER )
	@Fetch(value = FetchMode.SUBSELECT)
	private Map<String, Integer> consultasXMasculino = new HashMap<String, Integer>

	override actualizar(Usuario usuario) {

		//println("EN ACTUALIZAR CONSULTAS X SEXO")
		usuario.getConsultas().forEach [
			if(! consultasXFemenino.containsKey(it.nombre)) consultasXFemenino.put(it.nombre, 0)
			if(! consultasXMasculino.containsKey(it.nombre)) consultasXMasculino.put(it.nombre, 0)
			if (usuario.sexo == Sexo.FEMENINO) {
				consultasXFemenino.put(it.nombre, consultasXFemenino.get(it.nombre) + 1)
			} else
				consultasXMasculino.put(it.nombre, consultasXMasculino.get(it.nombre) + 1)
		]
	}

	def Map<String, Integer> getEstadisticaFemenino() {
		consultasXFemenino
	}

	def Map<String, Integer> getEstadisticaMasculino() {
		consultasXMasculino
	}

	override reset() {
		consultasXFemenino.clear
		consultasXMasculino.clear
	}

}
