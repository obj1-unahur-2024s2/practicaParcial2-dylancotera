class Personaje {
  const property fuerza
  var property rol

  method cambiarRol(unRol) { rol = unRol }

  method potencialOfensivo()  = fuerza * 10 + rol.extra()

  method esGroso() = self.esInteligente() || rol.esGroso(self)

  method esInteligente()
}

class Orco inherits Personaje {

  override method potencialOfensivo() = super() * 1.10

  override method esInteligente() = false
}

class Humano inherits Personaje {
  const inteligencia = 100

  override method esInteligente() = inteligencia > 50
  
}

object guerrero {
  
  method extra() = 100

  method esGroso(personaje) = personaje.fuerza() > 50
}

class Cazador {
  const mascota 

  method extra() = mascota.potencia()

  method esGroso(personaje) = mascota.esLongeva()

}

class Mascota {
  const fuerza
  const edad
  const property tieneGarras
     
  method potencia() = if ( tieneGarras ) { fuerza * 2 }
    else { fuerza}

  method esLongeva() = edad > 10

}

object brujo {
  method extra() = 0

  method esGroso(personaje) = true
}

class Localidad {
  
  var property ejercitoDefensor
 
  method ocupar(unEjercito){
    if ( self.esGrande(unEjercito) ) { ejercitoDefensor = unEjercito.nuevoEjercito(10) }
    else ejercitoDefensor = unEjercito
  }

  method esGrande(ejercito)

  method defensa() = ejercitoDefensor.potencialOfensivoTotal() 
}

class Aldea inherits Localidad {
  const property tamanio

  override method esGrande(ejercito) = ejercito.cantidadTotalIntegrantes() > tamanio
}

class Ciudad inherits Localidad {

  override method defensa() = super() + 300

  override method esGrande(ejercito) = false
}

class Ejercito{

  const integrantes = []

  method potencialOfensivoTotal() = integrantes.sum({ i =>i.potencialOfensivo() })
  
  method invadir(localidad) {
    if ( self.potencialOfensivoTotal() > localidad.defensa() )
      localidad.ocupar(self)   
  }
  
  method cantidadTotalIntegrantes() = integrantes.size()

  method nuevoEjercito(cantidad) = new Ejercito(integrantes = integrantes.sortBy({a,b => a.potencialOfensivo() > b.potencialOfensivo()}).take(cantidad))
}



