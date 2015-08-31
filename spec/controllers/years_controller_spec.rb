require 'rails_helper'

RSpec.describe YearsController, type: :controller do

  describe 'GET #index' do
    before do
      expect(Date).to receive(:today).and_return(Date.new 2015, 8, 31)
      get :index
    end

    it 'returns the correct list of Dominical years' do
      expect(response.body).to eql([
        1857, 1863, 1868, 1874, 1885, 1891, 1896, 1903,
        1908, 1914, 1925, 1931, 1936, 1942, 1953, 1959,
        1964, 1970, 1981, 1987, 1992, 1998, 2009, 2015
      ].to_json)
    end
  end

end
