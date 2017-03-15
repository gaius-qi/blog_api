class Api::V1::SessionsController < Api::ApplicationController

  def create
    @user = User.find_by(email: create_params[:email])
    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
      render json: @user
    else
      render json: error(401, '验证失败')
    end
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
