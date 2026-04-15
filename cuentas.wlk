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
        return (self.saldoCuenta(cuentaPrimaria) + self.saldoCuenta(cuentaSecundaria))
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
        self.extraerDeCuentas(monto)
    }

    method extraerDeCuentas(monto){
        if ((self.saldoCuenta(cuentaPrimaria) - monto) > 0){ 
                cuentaPrimaria.retirar(monto) 
                }
            else {
                cuentaSecundaria.retirar(monto - self.saldoCuenta(cuentaPrimaria))
                cuentaPrimaria.retirar(self.saldoCuenta(cuentaPrimaria))
            }
    }

    method saldoCuenta(cuenta){
       return 0.max(cuenta.saldo())
    }
    
    method validarExtraccion(monto){
        if (self.saldo() < monto){
            self.error("no hay suficiente saldo para extraer")
        }
    }
}
