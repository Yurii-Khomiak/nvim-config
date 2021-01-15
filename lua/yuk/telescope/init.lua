local create_api = require('yuk.telescope.api')
local setup_telescope = require('yuk.telescope.setup')
local mappings = require('yuk.telescope.mappings')

local config = setup_telescope(mappings.setup)
local MyApi = create_api()

mappings.define()

return MyApi
