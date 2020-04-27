class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show, :user ]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def user
    @user = User.find_by username: params[:username]
    @articles = Article.where("author = ?", params[:username])
  end

  def new

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :content, :author))
    redirect_to article_path( @article )
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
    flash[:notice] = "Article was deleted"
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :content, :author))
    if @article.persisted?
      redirect_to @article
      flash[:notice] = "Article was successfully created"
    else
      flash[:alert] = "Title can't be blank and Content can't be empty"
      render "new"
    end

  end

end
