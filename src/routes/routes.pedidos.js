import { Router } from "express";
import { actualizarpedido, contadorpedido, crearpedido, eliminarpedido, listarpedido } from "../controllers/controllers.pedido.js";

const rutapedido = Router();

rutapedido.get("/", listarpedido)
rutapedido.get("/contadorpedido", contadorpedido)
rutapedido.post("/", crearpedido)
rutapedido.put("/", actualizarpedido)
rutapedido.delete("/:id_pedido", eliminarpedido)

export default rutapedido;