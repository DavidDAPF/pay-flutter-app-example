const mongoose  = require("mongoose")
// const Schema = mongoose.Schema
// const {Usuario} = require('../model/user.model')

const  cuentaschema = mongoose.Schema({
    cuenta:{
        type:String,
        required:[true,"Ingrese descripcion"],
        minlength:[5,"La descripción debe tener minimo 10 caracteres."]
    }, 
    saldo_disponible: {
        // type:  new Date().toString(), 
        type: Number,
    	// default: Date.now,
        required: [true, "You must select a date"]
    },
    status: {
        type: String,
         required: [true, "diga el tipo de prioridad que le corresponde"]
    }
   
},{timestamps:true});


const cuenta = mongoose.model('cuenta',cuentaschema);
module.exports = cuenta
