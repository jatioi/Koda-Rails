class RemoveFirstAndLastNameFromFeedback < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :first_name, :string
    remove_column :feedbacks, :last_name, :string
  end
end
