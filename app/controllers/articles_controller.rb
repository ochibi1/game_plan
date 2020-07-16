class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :limit_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
    # ログインしているユーザーの投稿のみを表示させたい場合の記述
    # @articles = current_user.articles.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: '作成しました'
    else
      render :new, alert: '作成できませんでした'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: '更新しました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: '削除しました' 
    else
      redirect_to root_path, alert: '削除できませんでした'
    end
  end

  private
  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :img).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def limit_user
    if @article.user != current_user
      redirect_to root_path, alert: '他の人の投稿なので、編集できません。'
    end
  end
end
