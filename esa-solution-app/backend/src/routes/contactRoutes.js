const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Menyajikan file statis
app.use(express.static(path.join(__dirname, 'public')));

// Rute untuk menyajikan index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Contoh rute API
app.get('/api/data', (req, res) => {
  // Logika untuk mengambil data dari database atau sumber lain
  res.json({ message: 'Hello from the API!' });
});

// Menjalankan server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});