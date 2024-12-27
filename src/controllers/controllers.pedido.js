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
const crearpedido = async (req, res) => {
    const pedidos = req.body;  

    try {
        
        const errores = [];
        
        for (const pedido of pedidos) {
            const { id_usuario, responsable, nombre_producto, fecha_pedido, cantidad, unidad_de_medida, caracteristicas } = pedido;

            // Validar datos requeridos
            if (!nombre_producto || nombre_producto === undefined) {
                errores.push(`El pedido de ${responsable} tiene un nombre de producto no válido.`);
                continue; 
            }

            
            const [producto] = await basededatos.query('SELECT id_producto FROM productos WHERE nombre = ?', [nombre_producto]);

            if (producto.length === 0) {
                errores.push(`El producto '${nombre_producto}' no existe en la base de datos para el pedido de ${responsable}.`);
                continue; 
            }

            const id_producto = producto[0].id_producto;

            
            const fechaFormateada = new Date(fecha_pedido).toISOString().slice(0, 19).replace('T', ' ');

            
            try {
                await basededatos.query('CALL SP_CREAR_PEDIDO(?, ?, ?, ?, ?, ?, ?)', [
                    id_usuario,      
                    responsable,      
                    id_producto,      
                    fechaFormateada,  
                    cantidad,         
                    unidad_de_medida,
                    caracteristicas    
                ]);
            } catch (error) {
                errores.push(`Error al crear el pedido de ${responsable}: ${error.message}`);
            }
        }

       
        if (errores.length > 0) {
            return res.status(400).json({ errores });
        }

        
        res.json({ "respuesta": "Los pedidos fueron creados correctamente" });

    } catch (error) {
        console.error("Error al crear los pedidos:", error);
        res.status(500).json({ "error": "Hubo un problema al crear los pedidos" });
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

const eliminartodoslospedidos = async (req, res) => {

    try {
        const respuesta = await basededatos.query(`CALL SP_ELIMINAR_TODOS_LOS_PEDIDOS()`)
        res.json({"respuesta": "Todos los pedidos se eliminaron"})
    } catch (error) {
        res.json({"respuesta": "No se pudo eliminar todos los pedidos"})
    }
}

const obtenerPedidosPorUsuario = async (req, res) => {
    const { id_usuario, rol } = req.usuario; 

    if (!id_usuario || !rol) {
        return res.status(400).json({ message: 'Datos del usuario o rol faltan en el token' });
    }

    try {
        let query;
        let params;

        
        if (rol === 'Cliente') {
            query = 'CALL SP_OBTENER_PEDIDOS_USUARIOS(?, ?)';
            params = ['Cliente', id_usuario];
        }
        
        else if (rol === 'Proveedor') {
            query = 'CALL SP_OBTENER_PEDIDOS_USUARIOS(?, ?)';
            params = ['Proveedor', id_usuario];
        }
        else if (rol === 'Administrador') {
            query = 'CALL SP_OBTENER_PEDIDOS_USUARIOS(?, ?)';
            params = ['Administrador', id_usuario];
        }
        
        else {
            return res.status(400).json({ message: 'Rol no válido. Use Cliente, Proveedor o Administrador.' });
        }

        
        const [results] = await basededatos.query(query, params);

        
        if (results && results.length > 0) {
            
            console.log('Resultados obtenidos:', results);

            return res.json({
                usuario: id_usuario,
                rol,
                pedidos: results[0] 
            });
        } else {
            
            return res.status(404).json({ message: 'No se encontraron pedidos para este usuario' });
        }

    } catch (error) {
        console.error('Error al ejecutar la consulta:', error);
        return res.status(500).json({ message: 'Hubo un error al obtener los pedidos', error: error.message });
    }
};





export {
    listarpedido, crearpedido, eliminarpedido, eliminartodoslospedidos, obtenerPedidosPorUsuario
}