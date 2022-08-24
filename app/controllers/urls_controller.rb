class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path
    else
      render :new, status: unprocessable_entity
    end
  end

  def index
    @url_string = Base64.encode64(Url.maximum(:id).next.to_s)
    @urls = Url.all
    @short_link = "localhost:3000/#{@url_string}"
  end

  def check_url
    uri = URI.parse(@short_link)
    id = uri.path.split('/')
    params = CGI.parse(uri.query)
  end

  private

  def url_params
    params.permit(:full_url, :url_string)
  end
end
