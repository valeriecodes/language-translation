class ArticlesController < ApplicationController
  load_and_authorize_resource

  def new
    @article = Article.new
    @categories = Category.all
  end

  def index
    if params[:q].blank?
      @articles = Article.paginate(page: params[:page], per_page: 20)
    else
      @articles = Article.article_search(params[:q]).paginate(page: params[:page], per_page: 20)
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
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      @categories = Category.all
      render 'edit'
    end
  end
 
 private
  def article_params
    params.require(:article).permit(:category, :english, :phonetic, :picture, :language_id)
  end
end
