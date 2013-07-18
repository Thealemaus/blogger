class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id	
	end
	
	def new
		@article = Article.new

		flash.notice = "Article '#{@article.title}' has been created"
	end
	
	def create
		@article = Article.create(article_params)
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "#{@article.title} has been destroyed :("

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' updated! :)"

		redirect_to article_path(@article)
	end

	def article_params
		params.require("article").permit(:title, :body, :tag_list, :image)
	end

end

