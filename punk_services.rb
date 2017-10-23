require 'httparty'
require 'json'

class PunkService

  include HTTParty

  base_uri 'https://api.punkapi.com/v2'

  def initialize
    @uri = ""
  end

  # &&&
  def parameters(options = {})
    if options.empty? == false
      @uri << "?"
      @uri
    options.each do |k, v|
      @uri << "#{k} = #{v}"
      query_response = JSON.parse(self.class.get('/beers#{uri}').body)
      response[0]
      end
    else
      parameters = JSON.parse(self.class.get('/beers').body)
      parameters[0]
    end
  end

  def pagination(options = {})
    if options.empty? == false
      @uri << "?"
    options.each do |k, v|
      @uri << "#{k} = #{v}"
      query_response = JSON.parse(self.class.get('/beers#{uri}').body)
      response[0]
      end
    else
      pagination = JSON.parse(self.class.get('/beers').body)
      pagination[0]
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

punk_service = PunkService.new
# p punk_service.all_beers
# p punk_service.single_beer(1)
# p punk_service.random_beer
# p punk_service.pagination
punk_service.parameters({"yeast" => "american", "abv" => 22})
puts punk_service.all_beers
