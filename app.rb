require 'sinatra'
require 'httparty'
require 'json'
require 'dotenv/load'
require 'puma'

configure do
    set :server, :puma
end

get '/' do
    erb :new_search
end

post '/search' do
    search_term = params[:search_term]
    github_token = ENV['GITHUB_TOKEN']
    github_api_url = "#{ENV['GITHUB_API_URL']}#{search_term}"

    response = HTTParty.get(
        github_api_url,
        headers: {
            'Authorization': "token #{github_token}"
        }
    )

    @repos = response.parsed_response['items']

    erb :results
end

