class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.string :name
      t.date :start
      t.date :finish
      t.boolean :status

      t.timestamps
    end
    add_index :periods, :name, unique: true
  end
end
