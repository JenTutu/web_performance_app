class Url < ActiveRecord::Base
  require 'open-uri'
  require 'date'
  require 'nokogiri'
  # validates_format_of :given_url, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  # default_scope{order('updated_at DESC')} #default displays most recent first

  before_save :url_status
  before_save :load_time 
  before_save :count_links
  validates_presence_of :given_url, uniqueness: true

  def url_status
    site = open(self.given_url)
    self.status = site.status[0] + " " + site.status[1]
  end

  def load_time
    start = Time.new
    open(self.given_url)
    stop = Time.new
    self.page_load_time = stop - start
  end

  def count_links
    self.num_of_links = Nokogiri::HTML(open(self.given_url)).xpath('//a').collect {|a| a.attr('href')}.length      
  end
end 
