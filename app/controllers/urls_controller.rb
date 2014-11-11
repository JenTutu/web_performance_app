class UrlsController < ApplicationController
include UrlsHelper
  def new
    @url = Url.new    
  end

  def create
    @url = Url.create(url_params)
    redirect_to @url
  end
  def show
    @url = Url.find(params[:id])
    @start = start_time
    @fetch = open_site(@url.given_url)
    @stop = stop_time
    @links = count_links(@url.given_url)
    @status = url_status(@url.given_url)
    # @time = load_time(@url.given_url)
  end
  
  private 
  def url_params
    params.require(:url).permit(:given_url)
  end
end
