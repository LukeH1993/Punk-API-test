require 'spec_helper'

describe "punk api" do

  before(:each) do
    service = PunkService.new
    @api_tests = service.single_beer(1)
  end

end
