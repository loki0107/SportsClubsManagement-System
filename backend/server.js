const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const adminRoutes = require("./routes/admin");
const publicRoutes = require("./routes/public");

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Static files (serve HTML from frontend)
app.use(express.static("../frontend"));

// API Routes
app.use("/api/admin", adminRoutes);
app.use("/api/public", publicRoutes); // <-- Add this line

// Start server
const PORT = 3000;
app.listen(PORT, () =>
  console.log(`🚀 Server running at http://localhost:${PORT}`)
);
