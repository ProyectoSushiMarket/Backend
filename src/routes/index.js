import { Router } from "express";
import rutaproducto from "./routes.productos.js";
import rutapedido from "./routes.pedidos.js";
import rutalogin from "./routes.login.js";
import rutausuario from "./routes.usuarios.js";

const ruta = Router();

ruta.use("/usuario", rutausuario);
ruta.use("/producto", rutaproducto);
ruta.use("/pedido", rutapedido);
ruta.use("/login", rutalogin)

export default ruta;