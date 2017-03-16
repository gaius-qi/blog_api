class Api::V1::PagesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @pages = paginate(user.pages)
  end
  
end
