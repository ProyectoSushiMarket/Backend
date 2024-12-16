import { Router } from "express";
import { contadorpedido, crearpedido, eliminarpedido, listarpedido, obtenerPedidosPorUsuario} from "../controllers/controllers.pedido.js";
import { verifytoken } from "../middleware/token.js";


const rutapedido = Router();

rutapedido.get("/", listarpedido)
rutapedido.get("/contadorpedido", contadorpedido)
rutapedido.get("/pedidousuario", verifytoken, obtenerPedidosPorUsuario)
rutapedido.post("/", crearpedido)
rutapedido.delete("/:id_pedido", eliminarpedido)


export default rutapedido;