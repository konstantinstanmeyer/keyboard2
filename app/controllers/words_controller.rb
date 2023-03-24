# gems for handling api data
require 'net/http'
require 'pry'
require 'open-uri'
require 'json'

# fetches the data for both word APIS: BaconIpsum and PaperQuotes
class WordsController < ApplicationController
    URL = "https://baconipsum.com/api/?type=all-meat&paras=1"
    URL2 = "https://api.paperquotes.com/apiv1/quotes/?minlength=200"

    # fetches data for bacon ipsum requests, using URL constant
    def fetch
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        @words = response.body
        render json: @words.split(' '), status: :ok
    end

    # fetches data for paper quotes requests, using URL constant
    def get_quote
        # creates a uri object from a properly formatted string
        url = URI.parse("https://api.paperquotes.com/apiv1/quotes/?minlength=200&lang=#{params[:lang]}")
        # creates a net/http request
        req = Net::HTTP::Get.new(url)
        req["Authorization"] = "Token 5038d1464fb8642aad893c085d588052499539f8"
        # sets ssl value for encryption, and starts request stream
        response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
            http.request(req)
        end

        @quote = response.body
        render json: @quote, status: :ok
    end

end
