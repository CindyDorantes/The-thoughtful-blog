class LikesController < ApplicationController
  def new
    like = Like.new
    respond_to do |format|
      format.html { render :new, locals: { like: } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    # new object from params
    like = Like.new(post:, user: current_user)
    # respond_to block
    respond_to do |format|
      format.html do
        # if question saves
        if like.save
          # success message
          flash[:notice] = 'Like added successfully'
          # redirect to index
          redirect_to user_post_path(user, post)
        else
          # error message
          flash[:notice] = "Error: Couldn't add like"
          # render new
          render :new, locals: { like: }
        end
      end
    end
  end
end
