const express = require("express");
const router = express.Router();
const db = require("../db");

// Hardcoded login credentials
const ADMIN_USERNAME = "admin";
const ADMIN_PASSWORD = "SportsClub@2024";

// === ADMIN LOGIN ===
router.post("/login", (req, res) => {
  const { username, password } = req.body;
  if (username === ADMIN_USERNAME && password === ADMIN_PASSWORD) {
    res.status(200).json({ success: true });
  } else {
    res.status(401).json({ success: false, message: "Invalid credentials" });
  }
});

// ==== PLAYERS CRUD ====
router.get("/players", (req, res) => {
  db.query("SELECT * FROM players", (err, results) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, players: results });
  });
});

router.post("/players", (req, res) => {
  db.query("INSERT INTO players SET ?", req.body, (err, result) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, id: result.insertId });
  });
});

router.put("/players/:id", (req, res) => {
  db.query(
    "UPDATE players SET ? WHERE player_id = ?",
    [req.body, req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

router.delete("/players/:id", (req, res) => {
  db.query(
    "DELETE FROM players WHERE player_id = ?",
    [req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

// ==== TEAMS CRUD ====
router.get("/teams", (req, res) => {
  db.query(
    `SELECT t.team_id, t.team_name, c.name AS coach_name FROM Teams t LEFT JOIN coaches c ON t.coach_id = c.coach_id`,
    (err, results) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true, teams: results });
    }
  );
});

router.post("/teams", (req, res) => {
  db.query("INSERT INTO Teams SET ?", req.body, (err, result) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, id: result.insertId });
  });
});

router.put("/teams/:id", (req, res) => {
  db.query(
    "UPDATE Teams SET ? WHERE team_id = ?",
    [req.body, req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

router.delete("/teams/:id", (req, res) => {
  db.query("DELETE FROM Teams WHERE team_id = ?", [req.params.id], (err) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true });
  });
});

// ==== COACHES CRUD ====
router.get("/coaches", (req, res) => {
  db.query("SELECT * FROM coaches", (err, results) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, coaches: results });
  });
});

router.post("/coaches", (req, res) => {
  db.query("INSERT INTO coaches SET ?", req.body, (err, result) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, id: result.insertId });
  });
});

router.put("/coaches/:id", (req, res) => {
  db.query(
    "UPDATE coaches SET ? WHERE coach_id = ?",
    [req.body, req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

router.delete("/coaches/:id", (req, res) => {
  db.query("DELETE FROM coaches WHERE coach_id = ?", [req.params.id], (err) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true });
  });
});

// ==== MATCHES CRUD ====
router.get("/matches", (req, res) => {
  db.query("SELECT * FROM Matches", (err, results) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, matches: results });
  });
});

router.post("/matches", (req, res) => {
  db.query("INSERT INTO Matches SET ?", req.body, (err, result) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, id: result.insertId });
  });
});

router.put("/matches/:id", (req, res) => {
  db.query(
    "UPDATE Matches SET ? WHERE match_id = ?",
    [req.body, req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

router.delete("/matches/:id", (req, res) => {
  db.query("DELETE FROM Matches WHERE match_id = ?", [req.params.id], (err) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true });
  });
});

// ==== TOURNAMENTS CRUD ====
router.get("/tournaments", (req, res) => {
  db.query("SELECT * FROM Tournaments", (err, results) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, tournaments: results });
  });
});

router.post("/tournaments", (req, res) => {
  db.query("INSERT INTO Tournaments SET ?", req.body, (err, result) => {
    if (err)
      return res.status(500).json({ success: false, error: err.message });
    res.json({ success: true, id: result.insertId });
  });
});

router.put("/tournaments/:id", (req, res) => {
  db.query(
    "UPDATE Tournaments SET ? WHERE tournament_id = ?",
    [req.body, req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

router.delete("/tournaments/:id", (req, res) => {
  db.query(
    "DELETE FROM Tournaments WHERE tournament_id = ?",
    [req.params.id],
    (err) => {
      if (err)
        return res.status(500).json({ success: false, error: err.message });
      res.json({ success: true });
    }
  );
});

module.exports = router;
