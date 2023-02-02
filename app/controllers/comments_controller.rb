class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    # new object from params
    comment = Comment.new(text: params[:new_comment][:text], post:, user: current_user)
    # respond_to block
    respond_to do |format|
      format.html do
        # if question saves
        if comment.save
          # success message
          flash[:notice] = 'New comment saved successfully'
          # redirect to index
          redirect_to user_post_path(user, post)
        else
          # error message
          flash[:notice] = "Error: Couldn't create comment"
          # render new
          render :new, locals: { comment: }
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to user_path(current_user.id), notice: 'Comment deleted successfully'
  end
end
