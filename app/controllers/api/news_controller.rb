class Api::NewsController < ApplicationController
  def index
    @categories = %w[business entertainment general health science sports technology]
    api_params = {
      'apiKey': '11573f65e4ac461a9ab42136511e1230',
      country: 'ph'
    }


    url = 'https://newsapi.org/v2/top-headlines'
    @response = RestClient.get url, params: api_params
    @articles = JSON.parse(@response)['articles']
  end
end