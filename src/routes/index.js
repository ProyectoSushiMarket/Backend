import { Router } from "express";
import rutaproveedor from "./routes.proveedor.js";
import rutaproducto from "./routes.productos.js";
import rutapedido from "./routes.pedidos.js";
import rutacliente from "./routes.clientes.js";

const ruta = Router();


ruta.use("/proveedor", rutaproveedor);
ruta.use("/producto", rutaproducto);
ruta.use("/pedido", rutapedido);
ruta.use("/cliente", rutacliente)

export default ruta;