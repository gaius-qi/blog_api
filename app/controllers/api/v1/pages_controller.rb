class Api::V1::PagesController < Api::ApplicationController

  def index
    user = User.find(params[:user_id])
    @pages = user.pages.page(1).per(5)
    render json: @pages, meta: pagination_dict(@pages)
  end

  def show
    @pages = Page.find_by_id(params[:id])
    render json: @pages
  end

end
