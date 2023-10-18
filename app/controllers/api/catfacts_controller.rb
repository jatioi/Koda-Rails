class Api::CatfactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @catfacts = Catfact.all
    if params[:filter]== '1'
      @catfacts = Catfact.where(user: current_user)
    end
    end
  def create
    @catfact = Catfact.new
    @catfact.user = current_user
    catfact_url = 'https://catfact.ninja/fact'
    @response = RestClient.get catfact_url
    fact = JSON.parse(@response)['fact']

    @catfact.catfacts = fact

    if @catfact.save
      flash[:notice] = 'Catfact created successfully'
      redirect_to api_catfacts_path
    else
      flash.now[:alert] = 'Catfact create failed'
      redirect_to api_catfacts_path, status: :unprocessable_entity
    end

  end




end
