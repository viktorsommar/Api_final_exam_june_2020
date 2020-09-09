class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    comment = current_user.comments.create(comment_params)
    if comment.persisted?
      render json: { message: 'Your comment was submitted successfully!'}
    else
      render json: { message: 'Something went wrong!'}
    end
  end
end
