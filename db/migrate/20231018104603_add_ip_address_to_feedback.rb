class AddIpAddressToFeedback < ActiveRecord::Migration[7.0]
  def change
    add_column :feedbacks, :ip_address, :string
  end
end
