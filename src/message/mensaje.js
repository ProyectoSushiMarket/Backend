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