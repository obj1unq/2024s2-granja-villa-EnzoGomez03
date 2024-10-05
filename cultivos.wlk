import wollok.game.*
import hector.*

class Maiz {
	var property imageEstado = "baby"
	var position = null

	method position() = position
		// TODO: hacer que aparezca donde lo plante Hector

	method position(pos){
		position = pos
	}

	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_" + imageEstado + ".png"
	}

	method cambiarEstado(){
		imageEstado = "adult"
	}
	
	method crecer(){
		return if(imageEstado == "baby"){
			self.cambiarEstado()
		}
	}

	method arrancarDeTierra(){
		game.removeVisual(self)
	}
}

class Trigo {
  var property madurez = 0
  var position = null 
  var property evolucion = 0 
  
  method position() = position 

  method position(pos){
	position = pos
  }

  method image()= "wheat_" + madurez +".png"

  method crecer(){
	self.madurar()
	self.image()
  }

  method madurar(){
	return if(madurez <= 2){
		madurez=+1
	}
	else{madurez = 0
	} 
  }

  method arrancarDeTierra(){
		game.removeVisual(self)
	}
}

class Tamaco {
  var  property position = null

  method position() = position

  method position(pos) {
	position = pos
  } 

  method crecer(){
	position = game.at(self.position().x(), self.position().y()+1)
  }

  method image() = "tamaco_baby.png"

  method arrancarDeTierra(){
		game.removeVisual(self)
	}
}

