import cuentas.*
object casa {
    var cuentaParaGastos = null
    var gastos = 0
    var viveres = 0
    var reparaciones = 0
    method viveres(){
        return viveres
    }
    method reparaciones(){
        return reparaciones
    }
    method gastosDelMes(){
        return gastos
    }
    method gastarDinero(monto){
        cuentaParaGastos.retirar(monto)
        gastos = gastos + monto
    }
    method cuenta(_cuenta){
        cuentaParaGastos = _cuenta
    }
    method cambiarMes(){
        gastos = 0
    }
}
