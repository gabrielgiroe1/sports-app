class ChangeColumnTime < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :time, :string
  end
end