require 'httparty'
require 'json'

class PunkService
  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  # def parameters
  #   JSON.parse(self.class.get("/beers?brewed_before=11-2012&abv_gt=6").body)
  # end
  #
  # def pagination
  #   JSON.parse(self.class.get("/beers?page=2&per_page=80").body)
  # end

  def all_beers
    JSON.parse(self.class.get("/beers").body)
  end

  def single_beer(id)
    single_beers = JSON.parse(self.class.get("/beers/#{id}").body)
    single_beers[0]
  end

  def random_beer
    random_beers = JSON.parse(self.class.get("/beers/random").body)
    random_beers[0]
  end

end

punk_service = PunkService.new
# p punk_service.all_beers
# p punk_service.single_beer(1)
p punk_service.random_beer
