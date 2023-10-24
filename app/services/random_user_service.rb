class RandomUserService
  require 'rest-client'
  require 'json'

  API_URL = 'https://randomuser.me/api/'

  def fetch_random_user
    @response = RestClient.get(API_URL)
    # JSON.parse(@response)
    JSON.parse(@response)["results"][0]
  end
end
