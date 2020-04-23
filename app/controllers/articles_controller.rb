class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content))
    if @article.persisted?
      redirect_to @article
      flash[:notice] = "Article was successfully created"
    else
      flash[:notice] = "Title can't be blank and Content can't be empty"
      render "new"
    end

  end

end
