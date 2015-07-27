require 'open-uri'
require 'json'

module Cowa
  class OpenWeatherMap
    def client url
      return open(URI.encode(url)).read
    end
    
    def get_icon icon
      return open("http://openweathermap.org/img/w/#{icon}.png")
    end
    
    def get_information_place location
      req_url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}"
      return client req_url
    end
    
    def get_information_latlon lat, lon
      req_url = "http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}"
      return client req_url
    end
  end
end

=begin
temp  気温
temp_min  最低気温
temp_max  最高気温
icon  天気アイコン
main  天気
lat 緯度
lon 経度
pressure  気圧
sea_level 海面
humidity  湿度
speed 風速
name  都市名
country 国名
sunrise 日の出時間
sunset  日没時間
=end