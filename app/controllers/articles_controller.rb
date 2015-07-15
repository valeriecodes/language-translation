class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def new
    @article = Article.new
    @categories = Category.all
  end

  def index
    if params[:q].blank?
      @articles = Article.includes(:category, :language).page(params[:page]).per(20)
    else
      @articles = Article.includes(:category, :language).article_search(params[:q]).page(params[:page]).per(20)
    end
  end

  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
    else
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  def show
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      @categories = Category.all
      render 'edit'
    end
  end
 
 private
  def article_params
    params.require(:article).permit(:category_id, :english, :phonetic, :picture, :language_id)
  end

  def set_article
    @article = Article.includes(:category, :language).find(params[:id])
  end
end
