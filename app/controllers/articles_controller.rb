class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    flash.notice = "Article '#{@article.title}' Destroyed!"
    @article.destroy
    redirect_to articles_path
  end
  
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to articles_path(@article)
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end

