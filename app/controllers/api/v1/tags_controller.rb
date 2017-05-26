class Api::V1::TagsController < Api::ApplicationController
  include CacheHelper

  def index
    @tags = fetch_tags

    render json: @tags
  end

  def tag_pages
    tag_name = params[:tag_name]
    p "====================#{tag_name}"
    @pages = fetch_tag_pages tag_name
    render json: success(success_message: "not found any pages") and return if @pages.empty?
    render json: @pages
  end
end
