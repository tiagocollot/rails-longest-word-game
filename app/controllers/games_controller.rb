require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @response = params[:answer]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    api = JSON.parse(URI.open(url).read)
    @grid = params[:grid]

    @returnanswer = if wordsgrid == false
                      'Sorry but words can´t be built'
                    elsif api[:found] == true
                      'Sorry but this is not an English word'
                    else
                      'This not a valid and English word'
                    end
  end

  def wordsgrid
    @response.split('').each do |letter|
      return false unless @grid.include?(letter)
    end
    true
  end
end
