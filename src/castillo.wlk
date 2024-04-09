object castilloDePiedra {
	var property baul = #{}
	
	method guardarTodosLosArtefactos(artefactos){
		baul.addAll(artefactos)
	}
	
	method poderInvocacion(personaje) {
		return if (not baul.isEmpty()) self.masPoderoso(personaje).poder(personaje) else 0
		
		// return baul.map({artefacto => artefacto.poder(personaje)}).maxIfEmpty(0)
	}
	
	method masPoderoso(personaje) {
		return baul.max({artefacto => artefacto.poder(personaje)})
	}
}