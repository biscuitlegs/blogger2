class CommentsController < ApplicationController
    include CommentsHelper
    before_action :require_login

    def index
    end

    def new
        @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
    end
    
    def update
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.author_id = current_user.id
        @article = Article.find(@comment.article_id)

        if @comment.save
            flash[:success] = "Comment successfully posted."
            redirect_to article_path(@comment.article)
        else
            flash.now[:error] = "Error: Comment not posted. Please fix any mistakes and try again."
            render "articles/show"
        end
    end

    def destroy
        @comment = Comment.find(params[:article_id])
        @article = Article.find(@comment.article_id)
        @comment.destroy
        flash[:success] = "Comment successfully deleted."

        redirect_to @article
    end
end
