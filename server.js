const express = require('express');
const app = express();
const mongoose = require('mongoose');
const PORT = 6000;

app.use(express.json());

const speakingSchema = new mongoose.Schema({
  category: { type: String, required: true },
  content: { type: String, required: true }
}, { collection: 'speaking' });

const Speaking = mongoose.model('Speaking', speakingSchema); 
const speakingsSchema = new mongoose.Schema({
  username: String,
  country: String,
  
},{collection:'speakings'});
const speakings=mongoose.model('speakings',speakingsSchema);

mongoose.connect('mongodb://127.0.0.1:27017/publicspeaking', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function () {
  console.log('Connected to MongoDB');
});

app.post('/api/tips/storeUserDetails', async (req, res) => {
  console.log(req.body); 
  try {
    const { username, country } = req.body;

    const newUser = new speakings({
      username: username,
      country: country,
    });

    await newUser.save();
    res.status(200).send('User details saved successfully!');
  } catch (error) {
    console.error('Error saving user details:', error);  
    res.status(500).send(`Failed to save user details. Error: ${error.message}`);
  }
});

app.get('/api/tips/getUsers', async (req, res) => {
  try {
    const users = await speakings.find({}, 'username country'); 
    res.status(200).json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ message: 'Error fetching users', error });
  }
});

app.get('/api/tips/:category', async (req, res) => {
  const category = req.params.category;
  console.log(`Searching for category: ${category}`);

  try {
   
    const tips = await Speaking.find({ category: new RegExp(category, 'i') });

    if (tips.length === 0) {
      console.log('Tip not found');
      return res.status(404).json({ error: 'Tip not found' });
    }

    res.status(200).json(tips);
  } catch (error) {
    console.error('Error fetching tip:', error);
    res.status(500).json({ message: 'Error fetching tip', error });
  }
});
app.post('/api/tips/questions',async (req,res)=>{
  const options=req.body;
  const pattern=[2,2,2,1,2,2,1,2,2,1];
  
  if (JSON.stringify(options) === JSON.stringify(pattern)) {
    res.status(200).json(1);
  } else {
    res.status(400).json(0);
  }
});
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
