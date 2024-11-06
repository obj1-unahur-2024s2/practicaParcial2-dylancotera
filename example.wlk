class Personaje {
  const property fuerza
  var inteligencia
  var property rol

  method cambiarRol(unRol) { rol = unRol }

  method potencialOfensivo()  = fuerza * 10 + rol.extra()
}

class Orco inherits Personaje {
  override method potencialOfensivo() = super() * 1.10
}

class Humano inherits Personaje {

}


object guerrero {
  
  method extra() = 100
}

class Cazador {
  var mascota 

  method extra() = mascota.potencia()

}
  

class Mascota {
  var property fuerza
  const edad
  const property tieneGarras
     
  method potencia() = if ( tieneGarras ) { fuerza * 2 }
    else { fuerza}
}

class Brujo {
  method extra() = 0
}

