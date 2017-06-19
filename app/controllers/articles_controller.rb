class ArticlesController < ApplicationController
  def index
	@articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new article_params

    if @article.save
        redirect_back(fallback_location: root_path)
      #redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      #redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end

  def show
	@article = Article.find(params[:id])
  end
end