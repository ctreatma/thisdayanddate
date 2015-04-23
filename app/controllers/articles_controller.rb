class ArticlesController < ApplicationController
  def index
    date = "#{params[:year]}#{params[:month]}#{params[:day]}"
    search = ArticleSearch.new begin_date: date, end_date: date
    @articles = search.fetch
    render json: @articles
  end
end
