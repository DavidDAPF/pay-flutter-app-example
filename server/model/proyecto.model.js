const mongoose  = require("mongoose")
const Schema = mongoose.Schema
var  uniqueValidator  =  require ( 'mongoose-unique-validator' ) ;

const  proyectochema =  new Schema({
    title:{
        type:String,
        required:[true,"Ingrese el nombre del proyecto "],
        unique:true,
        minlength:[3,"El nombre del proyecto debe tener mas de 3 caracteres"],
        // success:["El nombre no es valido"]

    },
    fecha:{
        type: Date,
    	default: Date.now,
        required:[true,"Ingrese la fecha "]
    },
    cuentas:[
    {
        type: mongoose.Schema.Types.ObjectId,
        ref:'cuenta'
    } 
    ],
    statusticket:{
        type: String
        // enum:[1,2,3]
    }
   
},{timestamps:true});
proyectochema.plugin(uniqueValidator);


module.exports.proyecto = mongoose.model('proyecto',proyectochema);