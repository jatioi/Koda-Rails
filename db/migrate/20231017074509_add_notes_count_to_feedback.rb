class AddNotesCountToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :notes_count, :integer
  end
end
