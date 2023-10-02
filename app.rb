require 'sinatra'
require 'httparty'
require 'json'

get '/' do
    erb :new_search
end

