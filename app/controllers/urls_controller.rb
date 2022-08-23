class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url_key = Base64.encode64(Url.maximum(:id).next.to_s)
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path
    else
      render :new, status: unprocessable_entity
    end
  end

  def index
    @urls = Url.all
  end

  private

  def url_params
    params.permit(:full_url, :url_key)
  end
end
