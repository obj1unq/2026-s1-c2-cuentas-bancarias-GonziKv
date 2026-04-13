import cuentas.*
object casa {
    var cuentaParaGastos = null
    var gastos = 0
    method gastosDelMes(){
        return gastos
    }
    method gastarDinero(monto){
        cuentaParaGastos.retirar(monto)
        gastos = gastos + monto
    }
    method setCuenta(_cuenta){
        cuentaParaGastos = _cuenta
    }
    method cambiarMes(){
        gastos = 0
    }
}
