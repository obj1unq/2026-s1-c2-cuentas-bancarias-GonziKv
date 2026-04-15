import casa.*
object minimoEIndispensable{
    var calidadDeViveres = 1

    method calidadDeViveres(_calidadDeViveres){
        calidadDeViveres = _calidadDeViveres
    }

    method ejecutar(){
        if (not (casa.viveresSuficientes())){
            self.llegarAlMinimo()
        }
    }
    method llegarAlMinimo(){
        casa.comprarViveres (0.max( 40-(casa.viveres())), calidadDeViveres)
    }
}

object full{
    const calidadDeViveres = 5
    method ejecutar(){
        if (casa.viveres() < 100 && casa.casaEnOrden()){
            casa.comprarViveres(0.max(100 - (casa.viveres())), calidadDeViveres)
        }
        else if(casa.viveres() < 40){
            self.llegarAlMinimo()
        }
        else {
            self.completarReparaciones()
        }
    }

    method llegarAlMinimo(){
        casa.comprarViveres (0.max( 40-(casa.viveres())), calidadDeViveres)
    }

    method completarReparaciones(){
        self.comprobarSaldoParaReparaciones()
        casa.repararCasa()
    }

    method comprobarSaldoParaReparaciones(){
        if (casa.saldo() < casa.reparaciones()){
            self.error("No se puede reparar sin el dinero suficiente")
        }
    }
}