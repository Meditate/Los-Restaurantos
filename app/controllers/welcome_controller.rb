class WelcomeController < ApplicationController
  def index
    @articles=Article.all
    @article=Article.last
    @comments=Comment.where(article_id: @article)
    @random_comment=@comments.order("RANDOM()").first
  end
end
