const cuenta = require('../model/cuenta.model')
const Usuario = require('../model/user.model')


       const crearcuenta = async (req, res)=>{
        const {id} = req.params
        try{
            // const usuario = await Usuario.findById(id)
            // console.log(usuario.nombre, "aqui")
            // usuario.cuenta.push(req.body);
            // await usuario.save()
            // res.status(201).json(usuario.cuenta)
            const usuario = await Usuario.findById(id).exec()
            console.log(usuario, "aqui usuario")
            const cuentanew = new cuenta(req.body)
            console.log(cuentanew._id, "id cuenta")
            usuario.cuenta.addToSet(cuentanew._id);
            await usuario.save()
            await cuentanew.save()
            res.status(201).json(usuario.cuentanew)
        }
        catch(error){
            console.log(error)

        }
    }
            
        const obtenerUnacuenta=(req, res)=>{
            cuenta.findById(req.params.id)
            .then(cuenta=>{
                // res.json(resultado)
                if(cuenta){
                    return res.status(200).json(cuenta);
                }
                else{
                    res.statusMessage = "La cuenta indicada no existe.";
                    return res.status(404).end();
                }
            })
            .catch((error)=>{
                console.log(error)
            })
        }
        const cuentasactuales=(req, res)=>{
            cuenta.find(req.body)
            .then( (resultado)=>{
              
                res.json(resultado)
            })
            .catch((error)=>{
                console.log(error)
            })
        }
        const eliminarcuenta=(req, res)=>{
            const {id} = req.params;

            cuenta.findByIdAndDelete({_id:id})
            // cuenta.deleteOne({_id: req.params.id})
            .then(()=>{
                // res.json(resultado)
                return res.status(204).end();                
            })
            .catch((error)=>{
                res.statusMessage = "Hubo un error al intentar eliminar la película. "+error;
                // console.log(error)
                return response.status(400).end();
            })
        }



        module.exports={
            crearcuenta,
            obtenerUnacuenta,
            cuentasactuales,
            eliminarcuenta
        }
