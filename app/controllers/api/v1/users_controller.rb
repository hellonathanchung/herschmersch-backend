class Api::V1::UsersController < ApplicationController
  def create
    byebug
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
 
  def def show
    user = User.find_by(id: params[:id])
  end
  
  def index
  users = User.all
  render json:users
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :imageUrl)
  end

  
end