require 'httparty'
require 'json'

class PunkService

  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def initialize
    @uri = ""
  end

  def parameters(options = {})
    if options.empty? == false
      num_of_keys = 0
      @uri << "?"
    options.each do |k,v|
      @uri << "#{k}=#{v}"
      while num_of_keys < options.keys.length - 1
        @uri << "&"
        num_of_keys += 1
      end
      query = JSON.parse(self.class.get("/beers#{@uri}").body)
      query[0]
      end
    else
      parameters = JSON.parse(self.class.get("/beers").body)
      parameters[0]
    end
  end

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

ps = PunkService.new
# p punk_service.all_beers
# p punk_service.single_beer(1)
# p punk_service.random_beer
ps.parameters({"abv" => 5.2, "ibu" => 38})
p ps.parameters
