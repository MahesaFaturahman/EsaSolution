### Step 1: Project Structure

Create a directory structure like this:

```
esa-solution/
│
├── frontend/                # Frontend files (HTML, CSS, JS)
│   └── index.html
│
├── backend/                 # Backend files
│   ├── server.js            # Main server file
│   ├── routes/              # API routes
│   │   └── contact.js       # Contact form route
│   ├── models/              # Database models
│   │   └── Contact.js       # Contact model
│   └── config/              # Configuration files
│       └── db.js           # Database connection
│
└── package.json             # Node.js package file
```

### Step 2: Initialize the Backend

1. **Navigate to the backend directory** and initialize a new Node.js project:

   ```bash
   cd esa-solution/backend
   npm init -y
   ```

2. **Install necessary packages**:

   ```bash
   npm install express mongoose body-parser cors
   ```

### Step 3: Create the Backend

1. **Create `server.js`**:

   ```javascript
   // backend/server.js
   const express = require('express');
   const bodyParser = require('body-parser');
   const cors = require('cors');
   const mongoose = require('mongoose');
   const contactRoutes = require('./routes/contact');

   const app = express();
   const PORT = process.env.PORT || 5000;

   // Middleware
   app.use(cors());
   app.use(bodyParser.json());

   // Database connection
   mongoose.connect('mongodb://localhost:27017/esa_solution', {
       useNewUrlParser: true,
       useUnifiedTopology: true,
   })
   .then(() => console.log('MongoDB connected'))
   .catch(err => console.log(err));

   // Routes
   app.use('/api/contact', contactRoutes);

   app.listen(PORT, () => {
       console.log(`Server is running on http://localhost:${PORT}`);
   });
   ```

2. **Create the Contact Model**:

   ```javascript
   // backend/models/Contact.js
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

3. **Create the Contact Route**:

   ```javascript
   // backend/routes/contact.js
   const express = require('express');
   const router = express.Router();
   const Contact = require('../models/Contact');

   // POST contact form
   router.post('/', async (req, res) => {
       const { name, email, phone, service, message } = req.body;

       const newContact = new Contact({ name, email, phone, service, message });

       try {
           await newContact.save();
           res.status(201).json({ message: 'Contact saved successfully!' });
       } catch (error) {
           res.status(500).json({ message: 'Error saving contact', error });
       }
   });

   module.exports = router;
   ```

### Step 4: Modify the Frontend

1. **Update the form submission in `index.html`**:

   Replace the form submission JavaScript code with the following:

   ```javascript
   // Form submission
   document.getElementById('contactForm').addEventListener('submit', async function(e) {
       e.preventDefault();

       const formData = {
           name: this.name.value,
           email: this.email.value,
           phone: this.phone.value,
           service: this.service.value,
           message: this.message.value,
       };

       try {
           const response = await fetch('http://localhost:5000/api/contact', {
               method: 'POST',
               headers: {
                   'Content-Type': 'application/json',
               },
               body: JSON.stringify(formData),
           });

           if (response.ok) {
               alert('Terima kasih atas pesan Anda! Kami akan segera menghubungi Anda.');
               this.reset();
           } else {
               alert('Terjadi kesalahan, silakan coba lagi.');
           }
       } catch (error) {
           alert('Terjadi kesalahan, silakan coba lagi.');
           console.error(error);
       }
   });
   ```

### Step 5: Run the Application

1. **Start the backend server**:

   ```bash
   cd esa-solution/backend
   node server.js
   ```

2. **Open your `index.html` file in a browser** and test the contact form.

### Step 6: Database Setup

Make sure you have MongoDB installed and running on your machine. You can use MongoDB Atlas for a cloud solution if preferred.

### Conclusion

You now have a basic web application with a frontend and a backend that can handle form submissions and store them in a database. You can further enhance this application by adding features like user authentication, data validation, and more.