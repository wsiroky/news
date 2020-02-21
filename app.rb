require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
require "date"

def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "c6ca5f8ad331581079a7da9a68281a31"

# News API
url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=451c0bdc628341ec9d8c08c171eb9f92"
news = HTTParty.get(url).parsed_response.to_hash

get "/" do
  view "ask"
end

get "/news" do
    results = Geocoder.search(params["q"])
    lat_long = results.first.coordinates # => [lat, long]

    forecast = ForecastIO.forecast( lat_long[0], lat_long[1] ).to_hash
    @city = params["q"].upcase 

# Date and time setting
    @t1 = Time.now
    @t1_day = @t1.strftime("%A")
    @t1_month = @t1.strftime("%B")
    @t1_year = @t1.strftime("%Y")
    @t1_num = @t1.strftime("%d")

    @t2 = @t1 + 86400
    @t2_day = @t2.strftime("%A")
    @t2_month = @t2.strftime("%B")
    @t2_year = @t2.strftime("%Y")
    @t2_num = @t2.strftime("%d")#

    @t3 = @t2 + 86400
    @t3_day = @t3.strftime("%A")
    @t3_month = @t3.strftime("%B")
    @t3_year = @t3.strftime("%Y")
    @t3_num = @t3.strftime("%d")

    @t4 = @t3 + 86400
    @t4_day = @t4.strftime("%A")
    @t4_month = @t4.strftime("%B")
    @t4_year = @t4.strftime("%Y")
    @t4_num = @t4.strftime("%d")

    @t5 = @t4 + 86400
    @t5_day = @t5.strftime("%A")
    @t5_month = @t5.strftime("%B")
    @t5_year = @t5.strftime("%Y")
    @t5_num = @t5.strftime("%d")

    @t6 = @t5 + 86400
    @t6_day = @t6.strftime("%A")
    @t6_month = @t6.strftime("%B")
    @t6_year = @t6.strftime("%Y")
    @t6_num = @t6.strftime("%d")

    @t7 = @t6 + 86400
    @t7_day = @t7.strftime("%A")
    @t7_month = @t7.strftime("%B")
    @t7_year = @t7.strftime("%Y")
    @t7_num = @t7.strftime("%d")

     @t1_high_temp = forecast["daily"]["data"][0]["temperatureHigh"]
     @t2_high_temp = forecast["daily"]["data"][1]["temperatureHigh"]
     @t3_high_temp = forecast["daily"]["data"][2]["temperatureHigh"]
     @t4_high_temp = forecast["daily"]["data"][3]["temperatureHigh"]
     @t5_high_temp = forecast["daily"]["data"][4]["temperatureHigh"]
     @t6_high_temp = forecast["daily"]["data"][5]["temperatureHigh"]
     @t7_high_temp = forecast["daily"]["data"][6]["temperatureHigh"]

     @t1_conditions = forecast["daily"]["data"][0]["summary"].downcase
     @t2_conditions = forecast["daily"]["data"][1]["summary"].downcase
     @t3_conditions = forecast["daily"]["data"][2]["summary"].downcase
     @t4_conditions = forecast["daily"]["data"][3]["summary"].downcase
     @t5_conditions = forecast["daily"]["data"][4]["summary"].downcase 
     @t6_conditions = forecast["daily"]["data"][5]["summary"].downcase
     @t7_conditions = forecast["daily"]["data"][6]["summary"].downcase

     @headline1 = news["articles"][0]["title"]
     @description1 = news["articles"][0]["description"]
     @link1 = news["articles"][0]["url"]

     @headline2= news["articles"][1]["title"]
     @description2 = news["articles"][1]["description"]
     @link2 = news["articles"][1]["url"]

     @headline3 = news["articles"][2]["title"]
     @description3 = news["articles"][2]["description"]
     @link3 = news["articles"][2]["url"]

     @headline4 = news["articles"][3]["title"]
     @description4 = news["articles"][3]["description"]
     @link4 = news["articles"][3]["url"]

     @headline5 = news["articles"][4]["title"]
     @description5 = news["articles"][4]["description"]
     @link5 = news["articles"][4]["url"]

     @headline6 = news["articles"][5]["title"]
     @description6 = news["articles"][5]["description"]
     @link6 = news["articles"][5]["url"]

     @headline7 = news["articles"][6]["title"]
     @description7 = news["articles"][6]["description"]
     @link7= news["articles"][6]["url"]

     @headline8 = news["articles"][7]["title"]
     @description8 = news["articles"][7]["description"]
     @link8 = news["articles"][7]["url"]

     @headline9 = news["articles"][8]["title"]
     @description9 = news["articles"][8]["description"]
     @link9 = news["articles"][8]["url"]

     @headline10 = news["articles"][9]["title"]
     @description10 = news["articles"][9]["description"]
     @link10 = news["articles"][9]["url"]

    view "newspaper"

end