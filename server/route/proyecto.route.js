const proyectoController = require('../controller/proyecto.controller')
// const {authenticate} = require('../config/jwt.config')
module.exports = (app) => {
  app.get('/api/proyectos',/*authenticate*/ proyectoController.obtenerproyecto)
  app.get('/api/proyecto/:id', /*authenticate*/  proyectoController.obtenerUnaproyecto)
  app.post('/api/crearproyecto', /*authenticate*/  proyectoController.crearproyecto)
  app.put('/api/proyecto/editar/:id', /*authenticate*/  proyectoController.editarproyecto)
  app.delete('/api/proyecto/eliminar/:id', /*authenticate*/  proyectoController.eliminarproyecto)

}