   const express = require('express');
   const router = express.Router();

   // Contoh endpoint
   router.get('/api/users', (req, res) => {
       // Logika untuk mengambil data pengguna
       res.json([{ id: 1, name: 'John Doe' }]);
   });

   module.exports = router;