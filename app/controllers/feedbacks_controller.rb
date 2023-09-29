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

  private

  def feedback_params
    params.require(:feedback).permit(:title, :content)
  end
end





