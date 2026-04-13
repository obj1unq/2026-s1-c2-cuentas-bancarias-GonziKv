object cuentaCorriente{
    var saldo = 0
    method depositar(monto){
        saldo = saldo + monto
    }
    method retirar (monto){
        saldo = saldo - monto
    }
    method saldo(){
        return saldo
    }
    method saldo(_saldo){
        saldo = _saldo
    }
}
object cuentaGastos{
    var saldo = 0
    var costoOperacion = 0
    method costo(_costo){
        costoOperacion = _costo
    }
    method depositar(monto){
        self.validarDeposito(monto)
        saldo = saldo + monto - costoOperacion
    }
    method retirar(monto){
        saldo = saldo - monto
    }
    method validarDeposito(monto){
        if (monto <= costoOperacion){
            self.error("Deposito minimo insuficiente")
        }
    }
    method saldo(){
        return saldo
    }
    method saldo(_saldo){
        saldo = _saldo
    }
}
object cuentaCombinada{
    var cuentaPrimaria = cuentaCorriente
    var cuentaSecundaria = cuentaGastos
    method saldo(){
        return (0.max(cuentaPrimaria.saldo() + cuentaSecundaria.saldo()))
    }
    method cuentaPrimaria(_cuentaPrimaria){
        cuentaPrimaria = _cuentaPrimaria
    }
    method cuentaSecundaria(_cuentaSecundaria){
        cuentaSecundaria = _cuentaSecundaria
    }
    method depositar(monto){
        cuentaPrimaria.depositar(monto)
    }
    method retirar(monto){
        self.validarExtraccion(monto)
        self.retirarDeCuenta(cuentaPrimaria, monto)
    }
    method chequearSaldoNegativo(cuenta, monto){
        return ((0.max(cuenta.saldo()) - monto) < 0)
    }
    method validarExtraccion(monto){
        if (self.saldo() < monto){
            self.error("no hay suficiente saldo para extraer")
        }
    }
    method retirarDeCuenta(cuenta, monto){
        if (self.chequearSaldoNegativo(cuenta, monto)){
            cuenta.saldo(0.max(cuenta.saldo() - monto))
        }
        else {
            cuenta.saldo(cuenta.saldo() - monto)
        }
    }
}
