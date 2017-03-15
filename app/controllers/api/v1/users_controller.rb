class Api::V1::UsersController < Api::ApplicationController

  before_action :authenticate_user!, only: [:update]

  def update
    @user = User.find(params[:id])
    authorize @user, :update?
    @user.update_attributes(update_params)
    render json: @user, fields: {user: [:name]}
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update_params
    params.require(:user).permit(:name)
  end

end