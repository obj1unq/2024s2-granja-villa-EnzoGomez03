import hector.*
import cultivos.*

object granja {
  const property plantas = []

  method agregarCultivo(cultivo){
    plantas.add(cultivo)
  }

  method plantaPos(pos)= plantas.filter({planta => planta.position() == pos})
  
  method hayPlantas(pos)= self.plantaPos(pos).isEmpty()

  method regarEnPosicion(posicion){
    self.plantaPos(posicion).head().crecer()
  }

  method eliminarCultivo(cultivo){
    plantas.remove(cultivo)
    cultivo.arrancarDeTierra()
  }
  
}