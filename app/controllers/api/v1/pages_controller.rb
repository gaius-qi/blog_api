class Api::V1::PagesController < Api::ApplicationController
  include MdHelper
  include CacheHelper

  before_action :authenticate_user!, only: [:update, :create, :destory]

  def index
    @pages = fetch_pages_all
    render json: @pages
  end

  def show
    @page = fetch_page params[:id].to_i
    render json: error(error_message: 'page not exist') and return if @page.nil?
    render json: @page
  end

  def create
    params_create = params_create_page
    user_id = params[:user_id].to_i

    render json: error(error_message: 'user not exist') and return if (user = User.find_by(id: user_id)).nil?

    content_html = markdown(params_create[:content])

    @page = user.pages.build(
                              params_create
                                .except(:tags)
                                  .merge(content_html: content_html, created: Time.now, updated: Time.now)
                            )

    ActiveRecord::Base.transaction do
      @page.save!
      params_create[:tags].each do |tag_name|
        if tag = Tag.find_by(name: tag_name)
          PageTag.create!(page_id: @page.id, tag_id: tag.id)
        else
          @page.tags.create!(name: tag_name)
        end
      end
    end

    render json: success(success_message: 'save success', success_data: {page_id: @page.id})
  end

  def update
    params_update = params_update_page
    user_id = params[:user_id].to_i
    page_id = params[:id].to_i

    user = User.find_by(id: user_id)
    render json: error(error_message: 'user not exist') and return if user.nil?

    page = user.pages.find_by(id: page_id)
    render json: error(error_message: 'page nuseot exit') and return if page.nil?

    content_html = markdown(params_update[:content])

    ActiveRecord::Base.transaction do
      page.update_attributes!(params_update.merge(content_html: content_html).except(:user_id, :tags, :id))
      page.tags.destroy_all
      params_update[:tags].each do |tag_name|
        if tag = Tag.find_by(name: tag_name)
          PageTag.create!(page_id: page.id, tag_id: tag.id)
        else
          page.tags.create!(name: tag_name)
        end
      end
    end

    render json: success(success_message: 'update success', success_data: {page_id: page.id})
  end

  def destroy
    params = params_destory_page
    user_id = params[:user_id].to_i
    page_id = params[:id].to_i

    user = User.find_by(id: user_id)
    render json: error(error_message: 'user not exist') and return if user.nil?

    page = user.pages.find_by(id: page_id)
    render json: error(error_message: 'page nuseot exit') and return if page.nil?

    ActiveRecord::Base.transaction do
      page.destroy!
      page.page_tags.destroy_all
    end

    render json: success(success_message: 'destory page')
  end

  def pages_date_total
    @date = fetch_pages_date
    render json: @date
  end

  def paging
    @pages = fetch_pages params[:page_number].to_i
    render json: @pages
  end

  def archive_pages
    @pages = fetch_archive_pages params[:date]
    render json: error(error_message: 'archive pages not exist') and return if @pages.empty?
    render json: @pages
  end

  def click_page
    touch_click_page params[:id]
    render json: success(success_message: 'click success')
  end

  def page_click_count
    @click_count = get_page_click_count params[:id]
    render json: @click_count
  end

  def category
    render json: Page::PAGE_CATEGORY
  end

  private

  def params_create_page
    params.require(:page).permit(:title, :content, :summary, :category, tags:[])
  end

  def params_update_page
    params.require(:page).permit(:title, :content, :summary, :category, tags:[])
  end

  def params_destory_page
    params.permit(:user_id, :id)
  end

end
