const mongoose = require('mongoose');

const tipSchema = new mongoose.Schema({
  category: { type: String, required: true, unique: true },
  content: { type: String, required: true },
});


const Tip = mongoose.model('Tip', tipSchema);

module.exports = Tip;
