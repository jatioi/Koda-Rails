class NotesController < ApplicationController
  before_action :set_feedback
  before_action :notes, only: [:edit, :update]

  def index
    @notes = @feedback.notes
  end

  def new
    @note = @feedback.notes.build
  end

  def create
    @note = @feedback.notes.build(note_params)
    if @note.save
      flash[:notice] = 'note created successfully'
      redirect_to feedback_notes_path(@feedback)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @note.update(note_params)
      flash[:notice] = 'Comment updated successfully'
      redirect_to feedback_notes_path(@feedback)
    else
      render :edit
    end
  end

  private

  def set_feedback
    @feedback = Feedback.find params[:feedback_id]
  end

  # ...

  def note_params
    params.require(:note).permit(:content)
  end
end

