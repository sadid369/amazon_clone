// IMPORTS FROM PACKAGE
const express = require("express");
// IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");

//INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://sadid:502797@cluster0.1np02dp.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
