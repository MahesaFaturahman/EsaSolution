### Step 1: Set Up Your Project Structure

Create a new directory for your project and set up the following structure:

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
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── App.js
│   │   ├── index.js
│   ├── package.json
├── package.json
```

### Step 2: Initialize the Backend

1. **Navigate to the backend directory** and initialize a new Node.js project:

   ```bash
   cd esa-solution/backend
   npm init -y
   ```

2. **Install necessary packages**:

   ```bash
   npm install express mongoose dotenv cors body-parser
   ```

3. **Create a `.env` file** in the backend directory to store your environment variables:

   ```plaintext
   PORT=5000
   MONGODB_URI=your_mongodb_connection_string
   ```

4. **Create a database connection file** (`config/db.js`):

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

5. **Create a model for the contact form** (`models/Contact.js`):

   ```javascript
   const mongoose = require('mongoose');

   const contactSchema = new mongoose.Schema({
       name: { type: String, required: true },
       email: { type: String, required: true },
       phone: { type: String },
       service: { type: String },
       message: { type: String, required: true },
   });

   module.exports = mongoose.model('Contact', contactSchema);
   ```

6. **Create a route for handling contact form submissions** (`routes/contact.js`):

   ```javascript
   const express = require('express');
   const router = express.Router();
   const Contact = require('../models/Contact');

   // POST contact form
   router.post('/', async (req, res) => {
       const { name, email, phone, service, message } = req.body;

       try {
           const newContact = new Contact({ name, email, phone, service, message });
           await newContact.save();
           res.status(201).json({ message: 'Contact saved successfully' });
       } catch (error) {
           res.status(500).json({ message: 'Error saving contact', error });
       }
   });

   module.exports = router;
   ```

7. **Set up the Express server** (`server.js`):

   ```javascript
   const express = require('express');
   const cors = require('cors');
   const bodyParser = require('body-parser');
   const connectDB = require('./config/db');
   const contactRoutes = require('./routes/contact');

   const app = express();
   const PORT = process.env.PORT || 5000;

   // Connect to MongoDB
   connectDB();

   // Middleware
   app.use(cors());
   app.use(bodyParser.json());

   // Routes
   app.use('/api/contact', contactRoutes);

   app.listen(PORT, () => {
       console.log(`Server is running on port ${PORT}`);
   });
   ```

### Step 3: Initialize the Frontend

1. **Navigate to the frontend directory** and create a new React app:

   ```bash
   cd ../frontend
   npx create-react-app .
   ```

2. **Install Axios for making HTTP requests**:

   ```bash
   npm install axios
   ```

3. **Update the contact form submission in `src/components/ContactForm.js`**:

   ```javascript
   import React, { useState } from 'react';
   import axios from 'axios';

   const ContactForm = () => {
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
               console.error('Error submitting form:', error);
           }
       };

       return (
           <form onSubmit={handleSubmit}>
               {/* Form fields */}
               <input type="text" name="name" value={formData.name} onChange={handleChange} required />
               <input type="email" name="email" value={formData.email} onChange={handleChange} required />
               <input type="tel" name="phone" value={formData.phone} onChange={handleChange} />
               <select name="service" value={formData.service} onChange={handleChange}>
                   <option value="">Pilih Layanan</option>
                   <option value="Pengembangan Website">Pengembangan Website</option>
                   <option value="Aplikasi Mobile">Aplikasi Mobile</option>
                   <option value="Sistem Enterprise">Sistem Enterprise</option>
                   <option value="UI/UX Design">UI/UX Design</option>
                   <option value="Lainnya">Lainnya</option>
               </select>
               <textarea name="message" value={formData.message} onChange={handleChange} required></textarea>
               <button type="submit">Kirim Pesan</button>
           </form>
       );
   };

   export default ContactForm;
   ```

4. **Update `src/App.js` to include the ContactForm component**:

   ```javascript
   import React from 'react';
   import ContactForm from './components/ContactForm';

   const App = () => {
       return (
           <div>
               <h1>Hubungi Kami</h1>
               <ContactForm />
           </div>
       );
   };

   export default App;
   ```

### Step 4: Run the Application

1. **Start the backend server**:

   ```bash
   cd backend
   node server.js
   ```

2. **Start the frontend application**:

   ```bash
   cd ../frontend
   npm start
   ```

### Conclusion

You now have a basic web application with a frontend built in React and a backend using Express and MongoDB. The contact form on your website will now submit data to the backend, which saves it to the MongoDB database. You can further enhance this application by adding features like user authentication, form validation, and more.