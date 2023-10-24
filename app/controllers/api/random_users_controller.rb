class Api::RandomUsersController < ApplicationController

  def index
    random_user_service = RandomUserService.new # Instantiate the service
    @random_user = random_user_service.fetch_random_user # Call the method on the instance
    render 'api/random_users/index'
  end
end