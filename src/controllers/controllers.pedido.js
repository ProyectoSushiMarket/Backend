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
    const { id_usuario, nombre_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas } = req.body;

    try {
        
        if (!nombre_producto || nombre_producto === 'undefined') {
            return res.status(400).json({ "error": "Nombre de producto no válido" });
        }

        const [producto] = await basededatos.query('SELECT id_producto FROM productos WHERE nombre = ?', [nombre_producto]);

        if (producto.length === 0) {
            return res.status(404).json({ "error": "El producto no existe en la base de datos" });
        }

        const id_producto = producto[0].id_producto;

        const fechaFormateada = new Date(fecha_pedido).toISOString().slice(0, 19).replace('T', ' ');

        const [respuesta] = await basededatos.query('CALL SP_CREAR_PEDIDO(?, ?, ?, ?, ?, ?)', [
            id_usuario, 
            id_producto, 
            fechaFormateada,  
            cantidad, 
            unidad_de_medida, 
            caracteristicas
        ]);

        res.json({ "respuesta": "El pedido fue creado correctamente" });
    } catch (error) {
        console.error("Error al crear el pedido:", error);
        res.status(500).json({ "error": "El pedido no se pudo crear" });
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

    const {id_pedido} = req.params;

    try {
        const respuesta = await basededatos.query(`CALL SP_ELIMINAR_PEDIDO(?)`, [id_pedido])
        res.json({"respuesta": "Pedido Eliminado"})
    } catch (error) {
        res.json({"Error": "El pedido no se pudo eliminar"})
    }

}

const obtenerPedidosPorUsuario = async (req, res) => {
    const { id_usuario, rol } = req.usuario; // Asegúrate de que este middleware proporciona el ID y el rol del usuario

    if (!id_usuario || !rol) {
        return res.status(400).json({ message: 'Datos del usuario o rol faltan en el token' });
    }

    try {
        // Llama al procedimiento almacenado con los parámetros correctos
        const [results] = await basededatos.query('CALL SP_OBTENER_PEDIDOS_USUARIOS(?, ?)', [rol, id_usuario]);

        if (results && results.length > 0) {
            console.log('Resultados obtenidos:', results);
            return res.json({
                usuario: id_usuario,
                rol,
                pedidos: results // Devuelve los pedidos obtenidos
            });
        } else {
            console.log('No se encontraron pedidos para este usuario');
            return res.status(404).json({ message: 'No se encontraron pedidos para este usuario' });
        }
    } catch (error) {
        console.error('Error al ejecutar la consulta:', error);
        return res.status(500).json({ message: 'Hubo un error al obtener los pedidos', error: error.message });
    }
};




export {
    listarpedido, contadorpedido, crearpedido, actualizarpedido, eliminarpedido, obtenerPedidosPorUsuario
}