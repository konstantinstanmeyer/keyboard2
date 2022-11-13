require 'net/http'
require 'pry'
require 'open-uri'
require 'json'

class WordsController < ApplicationController
    URL = "https://baconipsum.com/api/?type=all-meat&paras=1"
    URL2 = "https://api.paperquotes.com/apiv1/quotes/?minlength=200"

    def fetch
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        @words = response.body
        render json: @words.split(' '), status: :ok
    end

    def get_quote
        url = URI.parse("https://api.paperquotes.com/apiv1/quotes/?minlength=200&lang=#{params[:lang]}")
        req = Net::HTTP::Get.new(url)
        req["Authorization"] = "Token 5038d1464fb8642aad893c085d588052499539f8"
        response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
            http.request(req)
        end

        @quote = response.body
        render json: @quote, status: :ok
    end

end
