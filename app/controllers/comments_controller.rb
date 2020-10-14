class CommentsController < ApplicationController
    include CommentsHelper

    def new
        @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.author_id = current_user.id
      
        @comment.save
      
        redirect_to article_path(@comment.article)
    end

    def destroy
        @comment = Comment.find(params[:article_id])
        @comment.destroy

        redirect_to articles_path
    end
end
