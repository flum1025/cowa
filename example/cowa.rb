# Coding: UTF-8
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cowa'
require 'pry'

open_weathermap_api_key = ""
yahoo_api_key = ""
info = Cowa::OpenWeatherMap.new(open_weathermap_api_key, yahoo_api_key)
puts info.get_information_place("千葉")
puts info.get_information_latlon(35,140)
exit

fore = Cowa::WeatherHacks.new(yahoo_api_key)
puts fore.forecast("千代田区")
