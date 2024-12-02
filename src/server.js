import express from "express"
import { config } from "dotenv";
import ruta from "./routes/index.js";

config();



const server = express();
server.use(express.json());
server.use("/", ruta)

server.set("port", process.env.PORT || 3100)
export default server;
