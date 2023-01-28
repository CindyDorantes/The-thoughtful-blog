class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: {comment: comment} }
    end
  end
end