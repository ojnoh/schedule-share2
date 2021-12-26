class SearchesController < ApplicationController
  def index
    @articles = Article.all.search(params[:search])
  end
end
