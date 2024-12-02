import { basededatos } from "../config/mysql.database";
import { config } from "dotenv";
config();

 export const mostrarusuario = async (req, res) => {
    const {id} = req.params;
    try {
        const respuesta = await basededatos.query(`CALL SP_MOSTRAR_USUARIO ("${id}")`);
        res.json(respuesta[0])
    } catch (error) {
        res.json({"error": error})
    }
}
export const listarusuario = async (req, res) => {
    try {
        const [listar] = await basededatos.query(`CALL SP_LISTAR_USUARIO()`);
        return listar[0];
    } catch (error) {
        res.json({"error": error})
    }
}