 
object espadaDelDestino {
	var primeraVez = true
	
	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente()	
	}	
	
	method coeficiente() {
		return if (primeraVez) { 1 } else {0.5}
	}
		
	method usar() {
		primeraVez = false
	}
}


object collarDivino{
	
	var usos = 0
	 
 	method poder(personaje) {
		return 3 + self.extra(personaje)	
	}		
	
	method extra(personaje) {
		return if ( personaje.poderBase() > 6 ) {
			usos
		}   
		else {
			0
		}
	}
	
	method usar() {
		usos += 1 
	}
	
}

object armaduraDeAceroValyrio{
	
	method poder(personaje) {
		return 6
	}		
	
	method usar() {
		
	}
	
}

object libroDeHechizos{
	/*- El libro de hechizos contiene varios hechizos, pero solo se pueden usar de uno a la vez. 
Los hechizos están ordenados y se utilizan en ese orden.

Luego de utilizar  un hechizo éste se descarta. Existen estos 3 hechizos (pero podría haber más)
  - Bendición: aporta 4 de poder de pelea
  - Invisibilidad: aporta la misma cantidad que el poder de pelea base del personaje
  - Invocación: Aporta el valor del artefacto más poderoso para el héroe que posee en su morada. (el artefacto del castillo no sufre ningún efecto por la batalla)

Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo.
	 */
	var property hechizos = []
	
	method poder(personaje) {
		return if (not hechizos.isEmpty()) hechizos.first().poder(personaje) else 0	
	}		
	
	method usar() {
		if (not hechizos.isEmpty()) {
			hechizos.remove(hechizos.first())
			//hechizos = hechizos.drop(1) A lo funcional
		}
	}
	
}

//HECHIZOS
object bendicion {
	method poder(personaje) {
		return 4
	}
}

object invisibilidad {
	method poder(personaje) {
		return personaje.poderBase()
	}
}

object invocacion {
	
	method poder(personaje) {
		return personaje.poderInvocacion()	
	}
}