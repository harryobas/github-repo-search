require 'sinatra'
require 'httparty'
require 'json'
require 'dotenv/load'
require 'puma'

configure do
    set :server, :puma
end

helpers do 
    def data_from_github(search_term)

        github_token = ENV['GITHUB_TOKEN']
        github_api_url = "#{ENV['GITHUB_API_URL']}#{search_term}"

        HTTParty.get(
            github_api_url,
            headers: {
                'Authorization': "token #{github_token}"
            }
        )
    end
end

get '/' do
    erb :new_search
end

post '/search' do
    search_term = params[:search_term]
    response = data_from_github(search_term)
    @repos = response.parsed_response['items']

    erb :results
end

