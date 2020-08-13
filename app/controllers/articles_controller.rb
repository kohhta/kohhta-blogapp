class ArticlesController < ApplicationController
  def articles
    @article = Article.first
  end

end
