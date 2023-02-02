class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:user])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    # new object from params
    post = Post.new(title: params[:new_post][:title], text: params[:new_post][:text], user: current_user)
    # respond_to block
    respond_to do |format|
      format.html do
        # if question saves
        if post.save
          # success message
          flash[:notice] = 'New post saved successfully'
          # redirect to index
          redirect_to user_posts_path(current_user.id)
        else
          # error message
          flash.now[:notice] = "Error: Couldn't create post"
          # render new
          render :new, locals: { post: }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(comments: [:user]).find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to user_path(current_user.id), notice: 'Post deleted successfully'
  end
end
