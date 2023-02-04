class Api::V1::CommentsController < ApplicationController
  def index
    # /users/1/posts/1/comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    post = Post.find(params[:post_id])
    # new object from params
    comment = Comment.new(text: params[:new_comment][:text], post:, user: current_user)
    # if comment saves
    return unless comment.save

    render json: comment
  end
end
