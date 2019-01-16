class CreateLights < ActiveRecord::Migration[5.2]
  def change
    create_table :lights do |t|
      t.references :board, foreign_key: true
      t.datetime :switched_on
      t.datetime :switched_off

      t.timestamps
    end
  end
end
