class AddDataToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :data, :date
  end
end
