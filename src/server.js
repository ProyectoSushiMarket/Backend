import express from "express"
import { config } from "dotenv";
config();



const server = express();
server.use(express.json());

server.set("port", process.env.PORT || 3000)
export default server;
