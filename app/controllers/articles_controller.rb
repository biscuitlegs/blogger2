class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :require_login, except: [:index, :show]

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
        @article = Article.new(article_params)
        @article.author_id = current_user.id
        if @article.save
            flash[:success] = "Article '#{@article.title}' successfully created."
            redirect_to @article
        else
            flash.now[:error] = "Error: Article not created."
            render(:new)
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        redirect_to @article
    end

    def destroy
        @article = Article.find(params[:id])
        flash[:success] = "Article '#{@article.title}' successfully deleted."
        @article.destroy
        
        redirect_to articles_path
    end
end
