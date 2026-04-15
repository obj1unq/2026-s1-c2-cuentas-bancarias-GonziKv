import cuentas.*
object casa {
    var cuentaParaGastos = null
    var gastos = 0
    var viveres = 0
    var reparaciones = 0
    var estrategia= null

    method saldo(){
        return cuentaParaGastos.saldo()
    }

    method estrategia(_estrategia){
        estrategia = _estrategia
    }
    method cuenta(_cuenta){
    cuentaParaGastos = _cuenta
    }
    method viveres(_viveres){
        viveres = _viveres
    }
    method reparaciones(_reparaciones){
        reparaciones = _reparaciones
    }

    method viveres(){
        return viveres
    }

    method reparaciones(){
        return reparaciones
    }

    method registrarMontoAReparar(monto){
        reparaciones = reparaciones + monto
    }

    method comprarViveres(porcentajeAComprar, calidad){
        self.validarCompraDeViveres(porcentajeAComprar)
        self.gastarDinero(porcentajeAComprar * calidad)
        viveres = viveres + porcentajeAComprar
    }

    method casaEnOrden(){
        return (not (self.faltanReparaciones()) && self.viveresSuficientes())
    }

    method viveresSuficientes(){
        return viveres >= 40
    }
    
    method faltanReparaciones(){
        return reparaciones > 0
    }

    method gastosDelMes(){
        return gastos
    }
    
    method repararCasa(){
        if (self.faltanReparaciones()){
            self.gastarDinero(reparaciones)
            reparaciones = 0
        }
    }

    method validarCompraDeViveres(porcentaje){
        if (viveres + porcentaje > 100){
            self.error("Ya hay mas que suficientes viveres")
        }
    }

    method gastarDinero(monto){
        cuentaParaGastos.retirar(monto)
        gastos = gastos + monto
    }

    method cambiarMes(){
        estrategia.ejecutar()
        gastos = 0
    }
}
