import { Router } from "express";
import { crearpedido, eliminarpedido, eliminartodoslospedidos, listarpedido, obtenerPedidosPorUsuario} from "../controllers/controllers.pedido.js";
import { verifytoken } from "../middleware/token.js";


const rutapedido = Router();

rutapedido.get("/", listarpedido)
rutapedido.get("/pedidousuario", verifytoken, obtenerPedidosPorUsuario)
rutapedido.post("/", crearpedido)
rutapedido.delete("/:id_pedido", eliminarpedido)
rutapedido.delete("/", eliminartodoslospedidos)


export default rutapedido;