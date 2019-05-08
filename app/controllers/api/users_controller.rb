class Api::UsersController < ApplicationController
  def index
  @reviews = current_user.reviews
  @user = current_user
  render 'index.json.jbuilder'
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation]
      )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def ShowReview
    the_id = params[:id]
    @review = Review.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def destroy
    #find review
    the_id = params[:id]
    @review = Review.find_by(id: the_id)
    #delete review
    @review.destroy
    render json: {message: "Deleted"}
  end
end
