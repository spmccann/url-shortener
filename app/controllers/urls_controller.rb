class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to root_path
    else
      redirect_to root_path, notice: 'Not a valid URL. Please Try Again'
    end
  end

  def index
    request.url
    @url_string = Base64.urlsafe_encode64(Url.maximum(:id).next.to_s)
    @urls = Url.all
    @short_link = "localhost:3000/#{@url_string}"
  end

  def redirect
    answer_query = Url.find_by('url_string = ?', params[:url_string])
    if answer_query.nil?
      redirect_to root_path, notice: 'Sorry, that link does not exist.'
    else
      redirect_to answer_query.full_url, allow_other_host: true
    end
  end

  private

  def url_params
    params.permit(:full_url, :url_string)
  end
end
