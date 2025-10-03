const express = require("express");
const http = require("http");
const { Server } = require("socket.io");

const app = express();
const server = http.createServer(app);

const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

app.get("/", (req, res) => {
  res.send("<h1>Can I Be Happy? w(ﾟДﾟ)w </h1>");
});

io.on("connection", (socket) => {
  console.log(`[${new Date().toLocaleTimeString()}] A client connected! (ID: ${socket.id})`);
  socket.on("disconnect", () => {
    console.log(`[${new Date().toLocaleTimeString()}] A client disconnected.`);
  });
});

const PORT = 1557;
server.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
