class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id=current_user.id
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @article=Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article)
  end

  def edit
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :mark)
    end
end
