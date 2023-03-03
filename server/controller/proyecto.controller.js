const {proyecto} = require('../model/proyecto.model')



const obtenerproyecto=(req, res)=>{
    proyecto.find(req.body)
    .then((resultado)=>{
        res.json(resultado)
    })
    .catch((error)=>{
        console.log(error)
    })
}
const obtenerUnaproyecto=(req, res)=>{
    proyecto.findById(req.params.id)
    .then((resultado)=>{
        res.json(resultado)
    })
    .catch((error)=>{
        console.log(error)
    })
}

const crearproyecto=(req, res)=>{
    proyecto.create(req.body)
    .then((resultado)=>{
        res.json(resultado)
    }).catch((error)=>{
        console.log(error)
    })
}

const editarproyecto=(req, res)=>{
    proyecto.updateOne({_id: req.params.id},req.body)
    .then((resultado)=>{
        res.json(resultado)
    })
    .catch((error)=>{
        console.log(error)
    })
}


const eliminarproyecto=(req, res)=>{
    proyecto.deleteOne({_id: req.params.id})
    .then((resultado)=>{
        res.json(resultado)
    })
    .catch((error)=>{
        console.log(error)
    })
}

//  async  function (req, res ) {
//     const nuevaproyecto = new proyecto(req.body)
//     const user  =await User.findById(req.params)
//     console.log(user)
//   }

module.exports={
    obtenerproyecto,
    obtenerUnaproyecto,
    editarproyecto,
    crearproyecto,
    eliminarproyecto,

}