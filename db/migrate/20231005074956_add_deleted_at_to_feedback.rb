class AddDeletedAtToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :deleted_at, :datetime, default: nil
  end
end
