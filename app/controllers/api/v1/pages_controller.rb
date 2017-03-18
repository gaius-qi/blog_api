class Api::V1::PagesController < Api::ApplicationController

  def index
    user = User.find(params[:user_id])
    ################################
    @pages = user.pages.page()
    ################################
    render @pages, meta: pagination_dict(@posts)
  end

end
