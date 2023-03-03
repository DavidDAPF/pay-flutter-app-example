const cuentaController = require('../controller/cuenta.controller')
module.exports = (app) => {
    app.post("/api/cuenta/usuario/:id" ,cuentaController.crearcuenta)
    app.get('/api/vercuenta/:id',cuentaController.obtenerUnacuenta)
    app.get("/api/cuentas/",cuentaController.cuentasactuales)
    app.delete('/api/cuenta/eliminar/:id',cuentaController.eliminarcuenta)
}

   