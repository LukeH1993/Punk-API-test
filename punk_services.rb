require 'httparty'
require 'json'

class PunkServices
  include HTTParty

  base uri 'https://api.punkapi.com/v2/beers'
end
