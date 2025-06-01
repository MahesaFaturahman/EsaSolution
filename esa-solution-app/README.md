### Step 1: Set Up Your Development Environment

1. **Install Node.js and npm**: Ensure you have Node.js and npm installed on your machine. You can download it from [Node.js official website](https://nodejs.org/).

2. **Install MongoDB**: You can either install MongoDB locally or use a cloud service like MongoDB Atlas. For local installation, follow the instructions on the [MongoDB installation page](https://docs.mongodb.com/manual/installation/).

3. **Install a Code Editor**: Use a code editor like Visual Studio Code, which is great for web development.

### Step 2: Create the Project Structure

1. **Create a new directory for your project**:
   ```bash
   mkdir esa-solution
   cd esa-solution
   ```

2. **Initialize a new Node.js project**:
   ```bash
   npm init -y
   ```

3. **Install necessary packages**:
   ```bash
   npm install express mongoose cors dotenv body-parser
   ```

4. **Create the following folder structure**:
   ```
   esa-solution/
   ├── backend/
   │   ├── config/
   │   │   └── db.js
   │   ├── models/
   │   │   └── Contact.js
   │   ├── routes/
   │   │   └── contact.js
   │   ├── .env
   │   ├── server.js
   └── frontend/
       ├── public/
       ├── src/
       │   ├── components/
       │   ├── App.js
       │   ├── index.js
       ├── package.json
   ```

### Step 3: Backend Setup

1. **Create a `.env` file in the `backend` directory**:
   ```plaintext
   MONGODB_URI=mongodb://localhost:27017/esa_solution
   PORT=5000
   ```

2. **Create `db.js` in `backend/config/`**:
   ```javascript
   const mongoose = require('mongoose');
   const dotenv = require('dotenv');

   dotenv.config();

   const connectDB = async () => {
       try {
           await mongoose.connect(process.env.MONGODB_URI, {
               useNewUrlParser: true,
               useUnifiedTopology: true,
           });
           console.log('MongoDB connected');
       } catch (error) {
           console.error('MongoDB connection failed:', error.message);
           process.exit(1);
       }
   };

   module.exports = connectDB;
   ```

3. **Create a model for contact messages in `backend/models/Contact.js`**:
   ```javascript
   const mongoose = require('mongoose');

   const ContactSchema = new mongoose.Schema({
       name: { type: String, required: true },
       email: { type: String, required: true },
       phone: { type: String },
       service: { type: String },
       message: { type: String, required: true },
   });

   module.exports = mongoose.model('Contact', ContactSchema);
   ```

4. **Create a route for handling contact form submissions in `backend/routes/contact.js`**:
   ```javascript
   const express = require('express');
   const router = express.Router();
   const Contact = require('../models/Contact');

   router.post('/', async (req, res) => {
       const { name, email, phone, service, message } = req.body;

       try {
           const newContact = new Contact({ name, email, phone, service, message });
           await newContact.save();
           res.status(201).json({ message: 'Contact message saved successfully' });
       } catch (error) {
           res.status(500).json({ message: 'Error saving contact message' });
       }
   });

   module.exports = router;
   ```

5. **Set up the server in `backend/server.js`**:
   ```javascript
   const express = require('express');
   const cors = require('cors');
   const bodyParser = require('body-parser');
   const connectDB = require('./config/db');
   const contactRoutes = require('./routes/contact');

   const app = express();
   const PORT = process.env.PORT || 5000;

   connectDB();

   app.use(cors());
   app.use(bodyParser.json());
   app.use('/api/contact', contactRoutes);

   app.listen(PORT, () => {
       console.log(`Server is running on port ${PORT}`);
   });
   ```

### Step 4: Frontend Setup

1. **Create a React app in the `frontend` directory**:
   ```bash
   npx create-react-app frontend
   cd frontend
   ```

2. **Install Axios for making HTTP requests**:
   ```bash
   npm install axios
   ```

3. **Modify `src/App.js` to include the contact form**:
   ```javascript
   import React, { useState } from 'react';
   import axios from 'axios';

   const App = () => {
       const [formData, setFormData] = useState({
           name: '',
           email: '',
           phone: '',
           service: '',
           message: '',
       });

       const handleChange = (e) => {
           setFormData({ ...formData, [e.target.name]: e.target.value });
       };

       const handleSubmit = async (e) => {
           e.preventDefault();
           try {
               await axios.post('http://localhost:5000/api/contact', formData);
               alert('Terima kasih atas pesan Anda! Kami akan segera menghubungi Anda.');
               setFormData({ name: '', email: '', phone: '', service: '', message: '' });
           } catch (error) {
               alert('Error sending message');
           }
       };

       return (
           <div>
               <h1>Contact Us</h1>
               <form onSubmit={handleSubmit}>
                   <input type="text" name="name" placeholder="Nama Lengkap" value={formData.name} onChange={handleChange} required />
                   <input type="email" name="email" placeholder="Email" value={formData.email} onChange={handleChange} required />
                   <input type="tel" name="phone" placeholder="Nomor Telepon" value={formData.phone} onChange={handleChange} />
                   <select name="service" value={formData.service} onChange={handleChange}>
                       <option value="">Pilih Layanan</option>
                       <option value="Pengembangan Website">Pengembangan Website</option>
                       <option value="Aplikasi Mobile">Aplikasi Mobile</option>
                       <option value="Sistem Enterprise">Sistem Enterprise</option>
                       <option value="UI/UX Design">UI/UX Design</option>
                       <option value="Lainnya">Lainnya</option>
                   </select>
                   <textarea name="message" placeholder="Pesan" value={formData.message} onChange={handleChange} required></textarea>
                   <button type="submit">Kirim Pesan</button>
               </form>
           </div>
       );
   };

   export default App;
   ```

### Step 5: Run the Application

1. **Start the backend server**:
   ```bash
   cd backend
   node server.js
   ```

2. **Start the frontend React application**:
   ```bash
   cd frontend
   npm start
   ```

### Step 6: Test the Application

- Open your browser and navigate to `http://localhost:3000` to see your React application.
- Fill out the contact form and submit it. Check your MongoDB database to see if the data is saved correctly.

### Conclusion

You now have a basic web application with a backend system and a database. You can further enhance this application by adding features like user authentication, form validation, and more. This setup provides a solid foundation for your web application.