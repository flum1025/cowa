Cowa
===========

##What is it?

rubyで書かれた天気APIの複合ライブラリです。
このライブラリはOpenWeatherMapAPIとWeather HacksAPIに対応しています。  
詳しくは  
[OpenWeatherMap](http://openweathermap.org/)  
[Weather Hacks](http://weather.livedoor.com/weather_hacks/)  

動作確認はubuntu14.04 ruby1.9.3とOS X Yosemite ruby2.0.0です。

##How to Use  
requireしてから

```
info = Cowa::OpenWeatherMap.new
puts info.get_information_place("東京")
```
の様な感じで使用してください。



##Notice
データがない場合はすべてnilを返します。  
/cowa/cowa.rbをrequireすることですべてのライブラリを呼び出すことができますが、  
最小限だけにとどめたい場合は/cowa/cowa/の中から必要なものだけrequireしてください。   
Weather Hacksを使用する場合は内部でYapiライブラリの一部を参照しているためnewするときに引数としてyahooのapi_keyを投げてください。
cowa-example.rbは使用例ですので、参考にしてみてください。  


質問等ありましたらTwitter:[@flum_](https://twitter.com/flum_)までお願いします。

##License

The MIT License

-------