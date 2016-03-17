require 'open-uri'
require 'json'
require 'active_support'
require 'active_support/core_ext'
require 'yapi'

module Cowa
  class WeatherHacks
    attr_accessor :rss
    
    def initialize(api_key)
      @contentsgeocoder = Yapi::OpenLocalPlatform::ContentsGeoCoder.new(api_key)
      self.rss = xml_to_json(open(URI.encode("http://weather.livedoor.com/forecast/rss/primary_area.xml")).read)[:rss][:channel][:source][:pref]
    end
    
    def xml_to_json xml
      doc = Hash.from_xml xml
      return JSON.parse(doc.to_json, symbolize_names: true)
    end
    
    def locationToRss location
      pref = get_pref location
      return nil if pref.nil?
      if pref[0][:Name] == "北海道"
        if location == "北海道"
          return self.rss[3][:city][0][:id]
        end
        for i in 0..4
          self.rss[i][:city].each do |c|
            return c[:id] if pref[1][:Name].include?(c[:title])
          end
        end
        return nil
      end
      unless pref.nil?
        city = get_city pref[0][:Name]
      else
        city = get_city location
      end
      id = get_id(city, location)
      return id
    end
    
    def get_pref location
      json = @contentsgeocoder.contentsGeoCoder(location)
      return nil if json[:YDF][:ResultInfo][:Count] == "0"
      return json[:YDF][:Feature][:Property][:AddressElement]
    end
    
    def get_city pref
      self.rss().each do |t|
        if t[:title] == pref
          return t[:city]
        end
      end
      return nil
    end
    
    def get_id(city, location)
      unless city.nil?
        city.each do |c|
          return c[:id] if c[:title] == location
        end
        return city[0][:id]
      else
        return nil
      end
    end
    
    def client url
      return open(URI.encode(url)).read
    end
    
    def forecast location
      rss = locationToRss(location)
      return nil if rss.nil?
      req_url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=#{rss}"
      return JSON.parse(client(req_url), symbolize_names: true)
    end
  end
end
