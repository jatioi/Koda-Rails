class AddIpInfoToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :ip_info, :string
  end
end
