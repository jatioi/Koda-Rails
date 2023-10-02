class ChangeColumnsForFeedbacks < ActiveRecord::Migration[7.0]
  def change
    remove_column :feedbacks, :title
    remove_column :feedbacks, :content
    add_column :feedbacks, :first_name, :string
    add_column :feedbacks, :last_name, :string
    add_column :feedbacks, :country, :integer
    add_column :feedbacks, :message, :text
  end
end
