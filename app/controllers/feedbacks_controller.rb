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

    if @feedback.save
      flash[:notice] = "feedback created succesfully"
      # Handle successful feedbacks submission (e.g., send email notification)
      redirect_to feedbacks_path
    else
      flash[:alert] = "feedback create failed"
      # Handle validation errors, re-render the form
      render 'news'

    end
  end

  def show
    @feedback = Feedback.find(params[:id])
    @feedback.ip_address = retrieve_ip_address

    ip_address = IpService.fetch_ip_address

  end

  def edit
    @feedback = Feedback.find(params[:id])
    if @feedback.nil?
    end
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(params.require(:feedback).permit(:first_name, :last_name, :country, :message))
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
    params.require(:feedback).permit(:first_name, :last_name, :country, :message, :remark)
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
end





