import wollok.game.*
import cultivos.*
import granja.*
import posiciones.*

object hector {
	
	var property position = game.center()

	const property image = "player.png"

	const property cosecha = #{}
	
	//movimiento
	method mover(direccion){
		self.validarMover(direccion)
		position =  direccion.siguiente(self.position())
	}

	method validarMover(direccion) {
		const siguiente = direccion.siguiente(self.position())
		tablero.validarDentro(siguiente)
	}

	method sembrarMaiz(){
		self.validarSembrar()
		const maiz = new Maiz()
		self.sembrarSemilla(maiz)
	}

	//sembrar
	method sembrarTrigo(){
		self.validarSembrar()
		const trigo = new Trigo()
		self.sembrarSemilla(trigo)
	}

	method sembrarTamaco(){
		self.validarSembrar()
		const tamaco = new Tamaco()
		self.sembrarSemilla(tamaco)
	}

	method validarSembrar(){
		if(not granja.hayPlantas(self.position())){
			self.error("No puedo plantar, esta ocupado")
		}
	}

	method sembrarSemilla(semilla){
		semilla.position(self.position())
		game.addVisual(semilla)
		granja.agregarCultivo(semilla)
	}

	//regar

	method regarPlanta(){
	  self.validarRegar(position)
	  self.regar()
	}

	method validarRegar(pos){
		if(granja.hayPlantas(pos)){
			self.error("no tengo nada para regar")
		}
	}

	method regar(){
		granja.regarEnPosicion(self.position())
	}

	//cosechar

	method cosechar(){
		self.validarSiHayPlanta()
		const planta =granja.plantaPos(self.position()).head()
		self.cosecharPlanta(planta)
	}

	method validarSiHayPlanta(){
		if(granja.hayPlantas(self.position())){
			self.error("no tengo nada para cosechar")
		}
	}

	method cosecharPlanta(planta){
		if(planta == Maiz && planta.imagenEstado() == "adult"){
			cosecha.add(planta)
			granja.eliminarCultivo(planta)
		}
		else if(planta == Trigo && planta.madurez() <= 2){
			cosecha.add(planta)
			granja.eliminarCultivo(planta)
		}
		else{
			cosecha.add(planta)
			granja.eliminarCultivo(planta)
		}
	}
} 