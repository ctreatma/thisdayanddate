class ArticleSearch
  attr_accessor :params

  def initialize(params = {})
    self.params = params
    self.params['api-key'] = Rails.configuration.article_search_key
  end

  def fetch
    result = JSON.parse RestClient.get("#{Rails.configuration.article_search_api}", params: params)
    result['response']['docs']
  end
end
