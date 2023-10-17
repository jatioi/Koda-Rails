class CreateCatfacts < ActiveRecord::Migration[7.0]
  def change
    create_table :catfacts do |t|
      t.text :catfacts
      t.belongs_to :user


      t.timestamps
    end
  end
end
