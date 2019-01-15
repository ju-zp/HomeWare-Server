class AddNameToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :name, :string
  end
end
