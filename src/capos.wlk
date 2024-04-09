import artefactos.*
import castillo.*

object rolando{
	
	var property capacidad = 2
	var property artefactos = #{}
	var property hogar = castilloDePiedra
	const property historialDeArtefactos = []
	var property poderBase = 5
	
	method encontrar(artefacto){
		if(self.puedeAgregar()){
			artefactos.add(artefacto)
		}
		historialDeArtefactos.add(artefacto)
	}
	
	method puedeAgregar(){
		return artefactos.size()<capacidad
	}
	
	method poderPelea() {
		return self.poderBase() + self.poderArtefactos()
	}
	
	method poderArtefactos() {
		return artefactos.sum({ artefacto => artefacto.poder(self) })

// NOOOOO!! ASI NO!! EL FOR EACH ES SOLO PARA ORDENES!
//		var acumulador = 0
//		artefactos.forEach({artefacto => acumulador += artefacto.poder(self) })
//		return acumulador
	}
	
	method batalla() {
		artefactos.forEach({artefacto => artefacto.usar() })
		poderBase += 1
	}
	
	
	method irAlHogar(){
		self.guardarArtefactosEnHogar()
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnHogar(){
		hogar.guardarTodosLosArtefactos(artefactos)
	}
	
	method liberarEspacio(){
		artefactos.clear()
	}
	
	method posee(artefacto){
		return self.todasLasPosesiones().contains(artefacto)
	}
	
	method todasLasPosesiones(){
		return artefactos.union(hogar.baul())
	}
	
	method poderInvocacion() {
		return hogar.poderInvocacion(self)
	}
	
	method enemigosVencibles(tierra) {
		return tierra.vencibles(self)
	}
	
	method vencible(enemigo) {
		return enemigo.poderPelea() < self.poderPelea()
	}
	
	method tieneArmaFatal(enemigo) {
		return artefactos.any({artefacto => self.esFatal(artefacto, enemigo)})
	}
		
	method esFatal(artefacto, enemigo) {
		return artefacto.poder(self) > enemigo.poderPelea()
	}
	
	method cantidadArmasFatales(enemigo) {
		return artefactos.count({artefacto => self.esFatal(artefacto, enemigo)})
	}
	
	method armaFatal(enemigo) {
		return artefactos.find({artefacto => self.esFatal(artefacto, enemigo)})
	}
	
	method armasFatales(enemigo) {
		return artefactos.filter({artefacto => self.esFatal(artefacto, enemigo)})
	}
	
	
}