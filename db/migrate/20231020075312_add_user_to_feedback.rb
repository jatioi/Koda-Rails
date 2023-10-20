class AddUserToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :full_name, :text

  end
end
