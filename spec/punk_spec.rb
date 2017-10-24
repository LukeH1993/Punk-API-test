require 'spec_helper'

describe "punk api" do

  before(:each) do
    service = PunkService.new
    @api_tests = service.single_beer(1)
  end

  # Alcohol By Volume is the measure of the volume of alcohol in beer.
  # The highest value of ABV in the Punk API was for the "world's strongest beer" which was 55% alcohol.

  it "Alcohol By Volume must be greater than 1 and less than 55" do
    expect(@api_tests["abv"]).to be_between(1, 55)
  end

  # IBU is the measurement of the bitterness of beer.
  # The highest value of IBU in the Punk API is 150.
  it "International Bittering Units must be greater than 1 and less than 150" do
    expect(@api_tests["ibu"]).to be_between(1, 150) unless(nil)
  end

  # EBC is the measurement of the colour in beer.
  # Ratings typically start from 4 and end in 79.
  it "European Brewery Convention must be greater than 4 and less than 79" do
    expect(@api_tests["ebc"]).to be_between(4, 79)
  end

  # The beer name will be stored in a string data type.
  it "Beer Name must be of a string type" do
    expect(@api_tests["name"]).to be_kind_of(String)
  end

  # The yeast description will be stored in a nil data type.
  it "Yeast must be of a nil type" do
    expect(@api_tests["yeast"].to_s).to be_kind_of(String)
  end


end
