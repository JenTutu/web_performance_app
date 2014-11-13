require 'rails_helper'

RSpec.describe UrlsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    it "creates an instance of Url" do
      get :index
      expect(@url).to exist
    end
  end

  describe "POST index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end  

  describe "GET show" do
    it "returns the specified url" do
      get :show
      expect(response).to render_template :show
    end
  end
end