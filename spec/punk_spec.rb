require 'spec_helper'

describe "punk api" do

  before(:each) do
    service = PunkService.new
    @api_tests = service.single_beer(5)
  end

  # it "Alcohol By Volume must be greater than 1 and less than 55" do
  #   expect(@api_tests["abv"]).to be_between(1, 55)
  # end

  # it "International Bitterness Units must be greater than 1 and less than 150" do
  #   expect(@api_tests["ibu"]).to be be_between(1, 150) unless(nil)
  # end

end
