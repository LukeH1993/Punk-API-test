
# Punk API Tests - Beer Tests

The main objective for this project was to test the Punk API utilising the JSON, HTTParty and RSpec Ruby gems. This project demonstrates simple tests for particular hashes for all alcoholic beverages within the API, and also for single and randomised beverages.

Punk API is a free-to-use application programming interface that enables programmers to search and filter through the official API for Brewdog's DIY Dog.

## Requirements
Punk API Tests requires the HTTParty gem and the RSpec gem and the JSON gem.

* Ruby version 2.0.0 or higher

### Gems
* HTTParty
* RSpec
* JSON

## Examples
Here is an example of a Punk API Test which was conducted on all alcoholic beverages.

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
