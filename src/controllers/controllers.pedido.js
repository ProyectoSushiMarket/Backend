import { basededatos } from "../config/mysql.database.js";
import { config } from "dotenv";
config();

const listarpedido = async (req, res) => {

    try {
        const [respuesta] = await basededatos.query(`CALL SP_LISTAR_PEDIDO()`);
        res.json(respuesta[0])
    } catch (error) {
        res.json({"error": error})
    }
};
const contadorpedido = async (req, res) => {

    try {
        const [respuesta] = await basededatos.query(`CALL SP_CONTADOR_PEDIDOS()`);
        res.json(respuesta[0])
    } catch (error) {
        res.json({"error": error})
    }
};
const crearpedido = async (req, res) => {

    const { id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas } = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_CREAR_PEDIDO(?, ?, ?, ?, ?, ?)`,[id_usuario, id_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas]
        );
        res.json({ "respuesta": "El pedido fue creado" });
    } catch (error) {
        res.json({ "error": "El pedido no se pudo crear" });
    }
};

const actualizarpedido = async (req, res) => {

    const {idpedido, estado} = req.body;

    try {
        const [respuesta] = await basededatos.query(`CALL SP_ACTUALIZAR_PEDIDO(?,?)`, [idpedido, estado]);
        res.json({"respuesta": "Pedido actualizado"})
    } catch (error) {
        res.json({"respuesta": "El pedido no se pudo actualizar"})
    }
};
const eliminarpedido = async (req, res) => {

    const {id} = req.params;

    try {
        const respuesta = await basededatos.query(`CALL SP_ELIMINAR_PEDIDO(?)`, [id])
        res.json({"respuesta": "Pedido Eliminado"})
    } catch (error) {
        res.json({"Error": "El pedido no se pudo eliminar"})
    }

}
export {
    listarpedido, contadorpedido, crearpedido, actualizarpedido, eliminarpedido
    
}