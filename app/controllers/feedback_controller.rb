class FeedbackController < ApplicationController
    # Display the feedback form (HTML form)
    # app/controllers/feedback_controller.rb

      def new
        @feedback = Feedback.new
      end

      def create
        @feedback = Feedback.new(feedback_params)
        post = Post.new(params[:post].permit(:title, :content))


        if @feedback.save
          # Handle successful feedback submission (e.g., send email notification)
          redirect_to feedback_thank_you_path
        else
          # Handle validation errors, re-render the form
          render 'new'
        end
      end

      private

      def feedback_params
        params.require(:feedback).permit(:name, :email, :message)
      end
    end





