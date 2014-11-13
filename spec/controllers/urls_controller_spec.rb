require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "creates a new url and redirects to the Url's page" do
      post "create", :url => {:given_url => "http://google.com"}
      expect(response).to redirect_to(assigns(:url))
    end
  end  

  describe "GET show" do
    let(:url){Url.create(:given_url => "http://google.com")}
    it "returns the specified url" do
      get :show, id: url
      expect(response).to render_template :show
    end
  end
end