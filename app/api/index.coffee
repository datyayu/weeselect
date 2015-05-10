# Dependencies.
express  = require "express"
champs   = require "./champs"

# Module variables.
router  = express.Router()

# API Routes.
router.use "/champs", champs


# Export router.
module.exports = router
