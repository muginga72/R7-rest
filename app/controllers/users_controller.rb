class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_user, only: %i[ show edit update destroy sign sign_out]

  def index
    @users = User.all
    render json: {users: @users}
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: { error:
        "Unable to create user: #{@user.errors.full_messages.to_sentence}"},
        status: 400
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def sign
    sign(user)
    redirect_to root_path
  end

  def sign_out
    sign_out(user)
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      #flash.alert = e.to_s
      redirect_to users_path
    end
end
