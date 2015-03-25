class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		if params[:q].present?
			@articles= Article.entitled(params[:q])
		else
			@articles = Article.all
		end
	end

	
	def show
		@article = Article.find(params[:id])
		#@article.increment!(:view_count)
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def search
		@articles = Article.entitled(params[:q])

		render 'index'
	end

	def create
		@article = Article.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text, :author)
		end
end
