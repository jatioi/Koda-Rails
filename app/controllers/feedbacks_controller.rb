class FeedbacksController < ApplicationController
  # Display the feedbacks form (HTML form)
  # app/controllers/feedbacks_controller.rb
  before_action :authenticate_user!

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    # feedback = Feedback.news(params[:post].permit(:title, :content))
    @feedback = Feedback.new(feedback_params)
    @feedback.ip_address = retrieve_ip_address
    @feedback.ip_info = retrieve_ip_info

    if @feedback.save
      flash[:notice] = "feedback created succesfully"
      # Handle successful feedbacks submission (e.g., send email notification)
      redirect_to feedbacks_path
    else
      flash[:alert] = "feedback create failed"
      # Handle validation errors, re-render the form
      render 'new'
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(params.require(:feedback).permit(:full_name, :country, :message))
      flash[:notice] = 'feedback updated successfully'
      redirect_to feedbacks_path
    else
      flash.now[:alert] = 'update failed'
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    flash[:notice] = 'Feedback deleted'
    redirect_to feedbacks_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:full_name, :country, :message, :remark)
  end

  def retrieve_ip_address
    begin
      # Fetch the IP address using your IpService or another method
      IpService.fetch_ip_address
    rescue RestClient::ExceptionWithResponse => e
      # Handle RestClient errors here, if needed
      'Unable to fetch IP address'
    end
  end

  def retrieve_ip_info
    begin
      ip = retrieve_ip_address
      # Fetch the IP address using your IpService or another method
      IpInfoService.fetch_ip_info(ip)
    rescue RestClient::ExceptionWithResponse => e
      # Handle RestClient errors here, if needed
      'Unable to fetch IP address'
    end
  end
end





