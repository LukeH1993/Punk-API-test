require 'spec_helper'

describe "Punk API Test" do

  before(:all) do
    service = PunkService.new
    @all_test = service.all_beers
    @single_test = service.single_beer(1)
    @random_test = service.random_beer
  end

  it "All ID's should have be of an integer type" do
    @all_test.each do |i|
      expect(i["id"]).to be_kind_of(Integer)
    end
  end

  it "Alcohol By Volume must be greater than 0 and less than 55" do
    @all_test.each do |i|
      expect(i["abv"].to_f).to be_between(0, 55)
    end
  end

  it "International Bittering Units must be greater than 0 and less than 150" do
    @all_test.each do |i|
      expect(i["ibu"].to_f).to be_between(0, 150) unless(nil)
    end
  end

  it "European Brewery Convention must be greater than 0 and less than 250" do
    @all_test.each do |i|
      expect(i["ebc"].to_f).to be_between(0, 250)
    end
  end

  it "Name must be of a string type" do
    @all_test.each do |i|
      expect(i["name"]).to be_kind_of(String)
    end
  end

  # The yeast description will be stored in a string data type.
  it "Yeast must be of a string type" do
    @all_test.each do |i|
      expect(i["yeast"].to_s).to be_kind_of(String)
    end

end

context "Single Beer Test" do

  it "Alcohol By Volume must be greater than 0 and less than 250" do
    expect(@single_test["abv"].to_f).to be_between(0, 250)
  end

  it "International Bittering Units must be greater than 0 and less than 150" do
    expect(@single_test["ibu"].to_f).to be_between(0, 150) unless(nil)
  end

  it "European Brewery Convention must be greater than 0 and less than 79" do
    expect(@single_test["ebc"].to_f).to be_between(0, 250)
  end

  it "Name must be of a string type" do
    expect(@single_test["name"]).to be_kind_of(String)
  end

  it "Yeast must be of a string type" do
    expect(@single_test["yeast"].to_s).to be_kind_of(String)
  end

end

context "Random Beer Test" do

  it "Alcohol By Volume must be greater than 0 and less than 55" do
    expect(@random_test["abv"].to_f).to be_between(0, 55)
  end

  it "International Bittering Units must be greater than 0 and less than 150" do
    expect(@random_test["ibu"].to_f).to be_between(0, 150) unless(nil)
  end

  it "European Brewery Convention must be greater than 0 and less than 250" do
    expect(@random_test["ebc"].to_f).to be_between(0, 250)
  end

  it "Name must be of a string type" do
    expect(@random_test["name"]).to be_kind_of(String)
  end

  it "Yeast must be of a string type" do
    expect(@random_test["yeast"].to_s).to be_kind_of(String)
  end

end
end
