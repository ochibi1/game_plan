class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to "/articles/#{comment.article.id}"
    else 
      redirect_to root_path
    end
  end
  
  def show
    @article = Article.find(params[:article_id])
   end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(article_id: params[:article_id])
  end
end
