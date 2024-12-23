export const mensajeconsola = (tipo, mensaje)=>{
    switch (tipo) {
        case "AccesoPuerto":
            console.log(mensaje.bgGreen);
            break;
        case "ErrorPuerto":
        console.log(mensaje.bgRed);
            break;
    }
}
export const Acceso = (req,res, status=200, mensaje="")=>{
    res.status(status).json({
        error: false,
        status: status,
        body: mensaje
    })
}
export const Error = (req, res,status=500, mensaje="")=>{
    res.status(status).json({
        error: true,
        status: status,
        body: mensaje
    })
}