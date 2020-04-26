class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new

  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content, :author))
    if @article.persisted?
      redirect_to @article
      flash[:notice] = "Article was successfully created"
    else
      flash[:notice] = "Title can't be blank and Content can't be empty"
      render "new"
    end

  end

end
