const express = require("express");
const router = express.Router();
const db = require("../db");

router.get("/players", (req, res) => {
  db.query("SELECT * FROM Players", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ players: rows });
  });
});

router.get("/teams", (req, res) => {
  db.query("SELECT * FROM Teams", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ teams: rows });
  });
});

router.get("/coaches", (req, res) => {
  db.query("SELECT * FROM coaches", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ coaches: rows });
  });
});

router.get("/matches", (req, res) => {
  db.query("SELECT * FROM Matches", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ matches: rows });
  });
});

router.get("/tournaments", (req, res) => {
  db.query("SELECT * FROM Tournaments", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ tournaments: rows });
  });
});

router.get("/equipment", (req, res) => {
  db.query("SELECT * FROM Equipment", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ equipment: rows });
  });
});

router.get("/fans", (req, res) => {
  db.query("SELECT * FROM FanRegistrations", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ fans: rows });
  });
});

router.get("/tickets", (req, res) => {
  db.query("SELECT * FROM Tickets", (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ tickets: rows });
  });
});

module.exports = router;
