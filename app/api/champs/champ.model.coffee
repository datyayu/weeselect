# Dependencies
mongoose = require 'mongoose'
Schema   = mongoose.Schema

# Champ
champSchema = new Schema
  # Champ info
  name: String
  id: String
  image: String
  min: String

  # Builds
  builds: [{
    title: String
    items: [
      count: Number
      id: String
    ]
  }]


  # Date/Time info
  createdAt:
    type: String
  updatedAt:
    type: String

# Export model
Champ = mongoose.model 'Champ', champSchema



module.exports = Champ
