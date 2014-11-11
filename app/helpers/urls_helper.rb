module UrlsHelper
  require 'open-uri'
  require 'date'
  require 'nokogiri'
  require 'benchmark'

    def start_time
      return Time.new
    end

    def stop_time
      return Time.new 
    end

    def open_site(url)
      open(url)
    end

    def count_links(url)
      source = open(url, &:readlines)
      links = Nokogiri::HTML(open(url)).xpath('//a').collect {|a| a.attr('href')}.length  
    end

    def url_status(url)
      site = open(url)
      site.status[0] + " " + site.status[1]
    end
    def load_time(url)
      Benchmark.measure {open(url)}
    end
end
