class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/articles/#{@comment.article.id}"
    else 
      redirect_to root_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    article = comment.article
    comment.destroy
    redirect_to "/articles/#{article.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
