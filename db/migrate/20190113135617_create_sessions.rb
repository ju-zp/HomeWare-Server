class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.datetime :logged_in
      t.datetime :logged_out

      t.timestamps
    end
  end
end
