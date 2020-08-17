class UsersController < ApplicationController
  
  def new
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @articles = user.articles
  end

  def destroy
  end

end
