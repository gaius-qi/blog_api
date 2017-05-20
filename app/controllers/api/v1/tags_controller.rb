class Api::V1::TagsController < Api::ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  # GET /tags
  def index
    @tags = fetch_tags

    render json: @tags
  end

  private
    def fetch_tags
      tags = $redis.get('tags')
      if tags.nil?
        tags = Tag.pluck(:name).to_json
        $redis.set('tags', tags)
        $redis.expire('tags',3.hour.to_i)
      end
      @tags = JSON.load tags
    end
end
