class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post }  }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
