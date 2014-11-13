class UrlsController < ApplicationController
  helper_method :sort_column, :sort_direction #to access these methods in the view
    def index 
      @urls = Url.order(sort_column + " " + sort_direction)
      @url = Url.new
    end

    def new
      @url = Url.new    
    end

    def create
      @url = Url.new(url_params)
      if @url.save
        redirect_to @url
      else
       @url.update_attribute(:page_load_time, @url.load_time)
       redirect_to @url
      end     
    end

    def show
      @url = Url.find_by(id: params[:id])
    end
    
  private 
    def url_params
      params.require(:url).permit(:given_url)
    end

    def sort_column
      Url.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end

    def sort_direction 
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
