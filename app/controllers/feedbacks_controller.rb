class FeedbacksController < ApplicationController
  # Display the feedbacks form (HTML form)
  # app/controllers/feedbacks_controller.rb

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    # feedback = Feedback.new(params[:post].permit(:title, :content))
    @feedback = Feedback.new(feedback_params)

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
end





