class AuthorSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_to(articles_path)
        flash[:success] = "Successfully logged in as #{current_user.username}."
      else
        flash.now.alert = "Login failed."
        render action: :new
      end
    end
  
    def destroy
      logout
      redirect_to articles_path
      flash[:success] = "Successfully logged out."
    end
end
