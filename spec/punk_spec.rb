require 'spec_helper'

describe "punk api" do

  before(:each) do
    service = PunkService.new
    @api_tests = service.all_beers
  end

  it "should have an ID rate for all beers" do
    puts @api_tests
    expect(@api_tests["id"]).to be_kind_of(Integer)
  end

  # Alcohol By Volume is the measure of the volume of alcohol in beer.
  # The highest value of ABV in the Punk API was for the "world's strongest beer" which was 55% alcohol.
  it "Alcohol By Volume must be greater than 0 and less than 55" do
    expect(@api_tests["abv"]).to be_between(0, 55)
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
  it "Name must be of a string type" do
    expect(@api_tests["name"]).to be_kind_of(String)
  end

  # The yeast description will be stored in a string data type.
  it "Yeast must be of a string type" do
    expect(@api_tests["yeast"].to_s).to be_kind_of(String)
  end

  # The first brewed date on record in the Punk API is September 2007.
  it "First Brewed date should be after September 2007" do
    expect(@api_tests["first_brewed"]).to eq("09/2007")
  end

  # The hops description will be stored in a string data type.
  it "Hops name should be of a string type" do
    @api_tests.each do |i|
      expect(@api_tests["hops"]["name"]).to be_kind_of(String)
    end
  end

  # The hops value will be stored in an integer data type.
  it "Hops amount value should be of an integer type" do
    @api_tests.each do |i|
      expect(i["hops"]["amount"]["value"]).to be_kind_of(Integer)
    end
  end

  # The hops unit will be grams.
  it "Hops amount units should be set to grams" do
    @api_tests.each do |i|
      expect(i["hops"]["amount"]["unit"]).to eq("grams")
    end
  end

  # The hops add will be stored in a string data type.
  it "Hops amount units should be set to grams" do
    @api_tests.each do |i|
      expect(i["hops"]["add"]).to be_kind_of(String)
    end
  end

  # The hops attribute will be stored in a string data type.
  it "Hops amount units should be set to grams" do
    @api_tests.each do |i|
      expect(i["hops"]["attribute"]).to be_kind_of(String)
    end
  end

  # The hops description will be stored in a string data type.
  it "Malt name should be of a string type" do
    @api_tests.each do |i|
      expect(i["malt"]["name"]).to be_kind_of(String)
    end
  end

  # The hops value will be stored in an integer data type.
  it "Malt amount value should be of a integer type" do
    @api_tests.each do |i|
      expect(i["malt"]["amount"]["value"]).to be_kind_of(Integer)
    end
  end

  # The hops unit will be kilograms.
  it "Malt amount units should be set to kilograms" do
    @api_tests.each do |i|
      expect(i["malt"]["amount"]["unit"]).to eq("kilograms")
    end
  end

  it "Food Pairing should be of a String type" do
    @api_tests.each do |i|
      expect(i["food_pairing"]).to be_kind_of(String)
    end
  end

end
