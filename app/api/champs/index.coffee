# Dependencies.
express    = require 'express'
controller = require './champ.controller'

# Module variables.
router  = express.Router()

# API Routes.
router.get    '/'   , controller.index
router.get    '/:id', controller.show
# router.post   '/'   , controller.create
# router.put    '/:id', controller.update
# router.patch  '/:id', controller.update
# router.delete '/:id', controller.destroy



# Export the router.
module.exports = router
