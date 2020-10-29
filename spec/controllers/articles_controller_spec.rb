require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'GET #index' do
    before do
      search = double ArticleSearch
      expect(ArticleSearch).to receive(:new).and_return(search)
      expect(search).to receive(:fetch).and_return({})
      get :index, params: { year: '1979', month: '01', day: '01' }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

end
