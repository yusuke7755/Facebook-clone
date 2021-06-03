class PostsController < ApplicationController
  def index
    @user = User.where(email: params[:session][:email].downcase)
  end
end
