require 'rails_helper'

RSpec.describe Url, :type => :model do

  let(:url){Url.new()}
  context "A Url should.." do
    it { is_expected.to respond_to(:given_url) }
    it { is_expected.to respond_to(:page_load_time) }
    it { is_expected.to respond_to(:num_of_links) }
    it { is_expected.to respond_to(:status) }
  end

  context "A Url should not be valid if it doesn't include a given_url" do
    before do
      @url = Url.create(given_url: "")
    end
    it { is_expected.to_not be_valid }
  end
end