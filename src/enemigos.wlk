/* 
En la tierra de Erethia existen 3 poderosos enemigos, de cada uno interesa saber su poder de pelea 
y su morada.

- Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
- Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
- Astra tiene 14 de poder pelea y vive en la torre de marfil
*/

object palacio {
}

object fortaleza {
}

object torre {
}

object archibaldo {
	var property hogar = palacio
	method poderPelea() {
		return 16
	}
}
object caterina {
	var property hogar = fortaleza
	method poderPelea() {
		return 28
	}
}

object astra {
	var property hogar = torre
	method poderPelea() {
		return 14
	}
}

object erethia {
	var property enemigos = #{archibaldo, caterina, astra} 	
	
	method vencibles(capo) {
		return enemigos.filter({enemigo => capo.vencible(enemigo)})
	}
	
	method hogaresConquistables(capo) {
		const vencibles = self.vencibles(capo) // #{archibaldo, astra}		
		return vencibles.map({enemigo => enemigo.hogar()}).asSet() // [palacio, torre] => #{palacio, torre}
	}
	
	method esPoderoso(capo) {
		
		return enemigos.all({enemigo => capo.vencible(enemigo)})
		
		// Funciona, pero no me demuestra conocimiento de los métodos de colecciones
		//return self.vencibles(capo) == enemigos 
	}
	
	
}  