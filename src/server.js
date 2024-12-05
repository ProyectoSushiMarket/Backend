import express from "express"
import { config } from "dotenv";
import ruta from "./routes/index.js";
import cors from "cors";
import morgan from "morgan";
import ejs from "ejs";
import { dirname } from 'path';
config();


const __filename = process.cwd();
const __dirname = dirname(__filename);
const server = express();
server.use(express.json());
server.use(express.urlencoded({ extended : true }));
server.use(cors());
server.use(morgan("dev"));
server.set("view engine", "ejs");
server.set("port", process.env.PORT || 4000)


//Rutas
server.use("/", ruta)

export default server;