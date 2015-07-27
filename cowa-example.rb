path = File.expand_path('../', __FILE__)
require File.join(path, 'cowa.rb')

info = Cowa::OpenWeatherMap.new
puts info.get_information_place("千葉")
puts info.get_information_latlon(35,140)

yahoo_api_key = ""
fore = Cowa::WeatherHacks.new(yahoo_api_key)
puts fore.forecast("千代田区")