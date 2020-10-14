class TagsController < ApplicationController
    before_action :require_login, except: [:index, :show]

    def index
        @tags = Tag.all
    end

    def show
        @tag = Tag.find(params[:id])
    end
end
